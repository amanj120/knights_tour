#include <stdio.h>
#include <stdint.h>
#include <immintrin.h>
#include <time.h>

#define at(i,j) [(i*64+j)]

#define STORE _mm256_storeu_si256
#define CMPGT _mm256_cmpgt_epi8
#define CMPEQ _mm256_cmpeq_epi8
#define LOAD _mm256_loadu_si256
#define SET _mm256_set1_epi8
#define ADD _mm256_adds_epi8
#define SUB _mm256_subs_epi8
#define AND _mm256_and_si256
#define OR _mm256_or_si256

int main() {
	srand(((long)(clock() * 1000))); 

	int8_t d[4096] 	__attribute__ ((aligned (32)));
	int8_t u[4096] 	__attribute__ ((aligned (32)));
	int8_t v[4096] 	__attribute__ ((aligned (32)));
	int8_t s[64] 	__attribute__ ((aligned (32)));

	const __m256i zero = SET(0);
	const __m256i one = SET(1);
	const __m256i three = SET(3);
	const __m256i fc = SET(0xfc);

	__m256i sjl, sjr, dil, dir, uil, uir, vil, vir, uil_pre, uir_pre, 
			uilgt3, uirgt3, uilfc, uirfc, uilin, uirin, keepvl, keepvr,
			onevl_t, onevr_t, onevl, onevr, newvl, newvr, ft, v_l, v_r;

	int edge_idx, edge_count, cur, has_0, sol_sum, st[64], en[64], ans[64];
	int failed_runs = 1;

	clock_t start = clock();
	while(1) {
		edge_idx = 0;
		cur = 0;
		edge_count = 0;
		has_0 = 0;
		failed_runs++;
		
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
		for (int x = 0x4000; x < 0xfa57; x++) { //~47,700
			sjl 		= SET(0);
			sjr 		= SET(0);
			for (int i = 0; i < 0x1000; i+=0x80) { //loop unrolling may be unnecessary
				v_l 	= LOAD((__m256i *)(v+i));
				v_r 	= LOAD((__m256i *)(v+i+0x20));
				sjl 	= ADD(v_l, sjl);
				sjr 	= ADD(v_r, sjr);
				v_l 	= LOAD((__m256i *)(v+i+0x40));
				v_r 	= LOAD((__m256i *)(v+i+0x60));
				sjl 	= ADD(v_l, sjl);
				sjr  	= ADD(v_r, sjr);
			}
						  STORE((__m256i_u *)(s), sjl);
						  STORE((__m256i_u *)(s+32), sjr);

			for(int i=0; i<0x1000; i+=0x40) {
				ft 		= SET((int8_t)(4 - s[i/64]));

				dil 	= LOAD((__m256i *)(d+i)); //for the *d[i][j]
				uil_pre = LOAD((__m256i *)(u+i)); //for the -s[j]
				uil 	= SUB(ft, sjl);
				uil 	= ADD(uil_pre, uil);
				uil 	= AND(dil, uil);
				vil 	= LOAD((__m256i *)(v+i)); //for the -s[j]
				uilgt3 	= CMPGT(uil, three); // filled with 0xff if u[i] > 3, else 0x00
				uilfc 	= AND(uil, fc);
				uilin 	= CMPEQ(uilfc, zero);
				keepvl 	= AND(uilin, vil);
				onevl_t = AND(uilgt3, dil);
				onevl 	= AND(onevl_t, one);
				newvl 	= OR(keepvl, onevl);
						  STORE((__m256i_u *)(v+i), newvl);
						  STORE((__m256i_u *)(u+i), uil);

				dir 	= LOAD((__m256i *)(d+i+0x20));
				uir_pre = LOAD((__m256i *)(u+i+0x20));
				uir 	= SUB(ft, sjr);
				uir 	= ADD(uir_pre, uir);
				uir 	= AND(dir, uir);
				vir 	= LOAD((__m256i *)(v+i+0x20));
				uirgt3 	= CMPGT(uir, three);
				uirfc 	= AND(uir, fc);
				uirin 	= CMPEQ(uirfc, zero);
				keepvr 	= AND(uirin, vir);
				onevr_t = AND(uirgt3, dir);
				onevr 	= AND(onevr_t, one);
				newvr 	= OR(keepvr, onevr);
						  STORE((__m256i_u *)(v+i+0x20), newvr);
						  STORE((__m256i_u *)(u+i+0x20), uir);
			}
		}

		for (int i = 0; i < 64; i++) {
			edge_count += s[i];
			st[i] = 0;
			en[i] = 0;
			ans[i] = 0;
		}

		if (edge_count != 128)
			continue;

		for (int i = 0; i < 64; i++) {
			for (int j = i+1; j < 64; j++) {
				if (v at(i,j) == 1) {
					st[edge_idx] = i;
					en[edge_idx] = j;
					ans[edge_idx] = 0;
					edge_idx++;
				}
			}
		}

		ans[0] = 1;
		sol_sum = 1;

		for (int i = 1; i < 64 ; i++) {
			for (int j = 0; j < 64 ; j++) {
				if (cur == st[j] || cur == en[j]) {
					int other = cur == en[j] ? st[j] : en[j];
					if (ans[other] == 0) {
						ans[other] = i+1;
						sol_sum += i+1;
						cur = other;
						break;
					}
				}
			}
		}

		if (sol_sum != 2080) //1+...64
			continue;

		for (int i = 0; i < 8; i++) {
			for (int j = 0; j < 8; j++) {
				printf("%2d ", ans[i*8+j]);
			}
			printf("\n");			
		}
		break;
	}
	clock_t end = clock();
	printf("%.3f s | %d runs\n", (((double) (end - start)) / CLOCKS_PER_SEC), failed_runs);
}