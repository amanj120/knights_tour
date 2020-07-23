#include <stdio.h>
#include <stdint.h>
#include <immintrin.h>
#include <time.h>

#define at(i,j) [(i*64+j)]

static clock_t start, end;
static int failed_runs = 1;

static int run(/*int N*/) {

	int8_t d[4096] 	__attribute__ ((aligned (32)));
	int8_t u[4096] 	__attribute__ ((aligned (32)));
	int8_t v[4096] 	__attribute__ ((aligned (32)));
	int8_t s[64] 	__attribute__ ((aligned (32)));

	const __m256i four = _mm256_set1_epi8(4);
	const __m256i neg1 = _mm256_set1_epi8(-1);
	const __m256i thre = _mm256_set1_epi8(3);
	const __m256i one = _mm256_set1_epi8(0x01);

	__m256i sjl, sjr;

	for(int i = 0; i < 64; i++) { //initialize
		for(int j = 0; j < 64; j++) { 
			int x = (i/8)-(j/8);
			int y = (i%8)-(j%8);
			d at(i,j) = 0;
			v at(i,j) = 0;
			u at(i,j) = 0;
			s[i] = 0;
			if (((x*x) + (y*y)) == 5) {
				d at(i,j) = 0xFF;
				d at(i,j) = 0xFF;
				v at(i,j) = rand()%2;
				v at(j,i) = v at(i,j);
			}
		}
	}

	// long max_num_iterations = (long)(N) * 10000l;

	for (int x = 0x4000; x < 0xfa57; x++) { //~47,000

		sjl = _mm256_set1_epi8(0);
		sjr = _mm256_set1_epi8(0);
		for (int i = 0; i < 4096; i+=0x40) { //loop unrolling may be unnecessary
			__m256i v_l = _mm256_loadu_si256((__m256i *)(v+i));
			__m256i v_r = _mm256_loadu_si256((__m256i *)(v+i+0x20));
			sjl = _mm256_adds_epi8(v_l, sjl);
			sjr  = _mm256_adds_epi8(v_r, sjr);
		}
		_mm256_storeu_si256((__m256i_u *)(s), sjl);
		_mm256_storeu_si256((__m256i_u *)(s+32), sjr);


		for(int i=0; i<4096; i+=0x40) {
			int8_t first = (4 - s[i/64]);

			__m256i f_term = _mm256_set1_epi8(first);

			__m256i dil = _mm256_loadu_si256((__m256i *)(d+i)); //for the *d[i][j]
			__m256i dir = _mm256_loadu_si256((__m256i *)(d+i+0x20));

			__m256i uil_pre = _mm256_loadu_si256((__m256i *)(u+i)); //for the -s[j]
			__m256i uir_pre = _mm256_loadu_si256((__m256i *)(u+i+0x20));

			__m256i uil = _mm256_subs_epi8(f_term, sjl);
			__m256i uir  = _mm256_subs_epi8(f_term, sjr);

			uil = _mm256_adds_epi8(uil_pre, uil);
			uir = _mm256_adds_epi8(uir_pre, uir);

			uil = _mm256_and_si256(dil, uil);
			uir = _mm256_and_si256(dir, uir);
			
			__m256i vil = _mm256_loadu_si256((__m256i *)(v+i)); //for the -s[j]
			__m256i vir = _mm256_loadu_si256((__m256i *)(v+i+0x20));

			__m256i uilgt3 = _mm256_cmpgt_epi8(uil, thre); // filled with 0xff if u[i] > 3, else 0x00
			__m256i uirgt3 = _mm256_cmpgt_epi8(uir, thre);

			__m256i uilgtn1 = _mm256_cmpgt_epi8(uil, neg1); //filled with 0xff if u[i] > -1 (>= 0), else 0x00
			__m256i uirgtn1 = _mm256_cmpgt_epi8(uir, neg1); 

			__m256i uillt4 = _mm256_cmpgt_epi8(four, uil); //filled with 0xff if 4 > u[i], else 0x00
			__m256i uirlt4 = _mm256_cmpgt_epi8(four, uir);

			__m256i uilin = _mm256_and_si256(uilgtn1, uillt4); //filled with 0xff if  (4 > u[i] > -1)
			__m256i uirin = _mm256_and_si256(uirgtn1, uirlt4);

			__m256i keepvl = _mm256_and_si256(uilin, vil); // filled with 0x01 and 0x00
			__m256i keepvr = _mm256_and_si256(uirin, vir);

			__m256i onevl_t = _mm256_and_si256(uilgt3, dil); //filled with 0xff and 0x00
			__m256i onevr_t = _mm256_and_si256(uirgt3, dir);

			__m256i onevl = _mm256_and_si256(onevl_t, one); //filled with 0x01 and 0x00
			__m256i onevr = _mm256_and_si256(onevr_t, one);

			__m256i newvl = _mm256_or_si256(keepvl, onevl);
			__m256i newvr = _mm256_or_si256(keepvr, onevr);

			_mm256_storeu_si256((__m256i_u *)(v+i), newvl);
			_mm256_storeu_si256((__m256i_u *)(v+i+0x20), newvr);
			_mm256_storeu_si256((__m256i_u *)(u+i), uil);
			_mm256_storeu_si256((__m256i_u *)(u+i+0x20), uir);
		}
	}


	int edge_count = 0;
	for (int i = 0; i < 4096; i++) {
		edge_count += v[i];
	}

	if (edge_count != 64) {
		return 1;
	}

	int starts[64];
	int ends[64];
	int edge_idx = 0;
	int cur = 0;
	int solution[64];

	for (int i = 0; i < 64; i++) {
		for (int j = i+1; j < 64; j++) {
			if (v at(i,j) == 1) {
				starts[edge_idx] = i;
				ends[edge_idx] = j;
				solution[edge_idx] = 0;
				edge_idx++;
			}
		}
	}

	solution[0] = 1;

	for (int i = 1; i < 64 ; i++) {
		for (int j = 0; j < 64 ; j++) {
			if (cur == starts[j] || cur == ends[j]) {
				int other = cur == ends[j] ? starts[j] : ends[j];
				if (solution[other] == 0) {
					solution[other] = i+1;
					cur = other;
					break;
				}
			}
		}
	}

	for (int i = 0; i < 64; i++) {
		if (solution[i] == 0) {
			return 1;
		}
	}

	for (int i = 0; i < 8; i++) {
		for (int j = 0; j < 8; j++) {
			printf("%2d ", solution[i*8+j]);
		}
		printf("\n");			
	}
	return 0;

}

int main(int argc, char **argv) {
    /* long seed = (long)(clock() * 1000);
	srand(seed);  
    if (argc >= 2) {
		seed = atoi(argv[1]);
	} // 1595464843, 1595466151, 1595466286 seeds give full results quickly
	// printf("seed: %ld\n", seed);
	int N = 5; //4 * 10,000 iterations -> best success rates based on 1000 trials
	if (argc == 3) {
		N = atoi(argv[2]) > 99 ? 99 : atoi(argv[2]);
	printf("%d0000 iterations per network run", N);
	}*/

	srand(((long)(clock() * 1000))); 
	start = clock();
	while(run(/*N*/))
		failed_runs++;
	end = clock();
	printf("%.2f s | %d runs\n", (((double) (end - start)) / CLOCKS_PER_SEC), failed_runs);
}