#include <stdio.h>
#include <stdint.h>
#include <immintrin.h>
#include <time.h>
#include <sys/time.h>

#define at(i,j) [(i*64+j)]

#define STORE(x,y) _mm256_storeu_si256((__m256i_u *)(x),y)
#define LOAD(x) _mm256_loadu_si256((__m256i *)(x))
#define SET _mm256_set1_epi8
#define ADD _mm256_add_epi8
#define SUB _mm256_sub_epi8
#define AND _mm256_and_si256
#define OR _mm256_or_si256
#define GT _mm256_cmpgt_epi8
#define EQ _mm256_cmpeq_epi8

void run(int ret[]) { //66 ints, first 64 are sol, last 2 are ms taken and nn runs
	struct timeval tp;
	gettimeofday(&tp, NULL);
	long int ms = tp.tv_sec * 1000 + tp.tv_usec / 1000;
	srand(ms); 

	int8_t d[4096] 	__attribute__ ((aligned (32)));
	int8_t u[4096] 	__attribute__ ((aligned (32)));
	int8_t v[4096] 	__attribute__ ((aligned (32)));
	int8_t s[64] 	__attribute__ ((aligned (32)));

	_mm256_zeroall();

	const __m256i _0;// = _mm256_setzero_si256();
	const __m256i _3 = SET(3);
	const __m256i fc = SET(0xfc);

	__m256i sjl, sjr, dil, dir, uil, uir, vil, vir, viln, virn, ft, sjln, sjrn; //total of 16 __m256i variables

	int edge_idx, edge_count, cur, has_0, sol_sum, st[64], en[64], ans[64];
	int failed_runs = 1;

	clock_t start = clock();
	while (1) {
		edge_idx = 0;
		cur = 0;
		edge_count = 0;
		has_0 = 0;
		failed_runs++;
		
		for (int i = 0; i < 64; i++) { //initialize
			for (int j = 0; j < 64; j++) { 
				int x = (i/8)-(j/8);
				int y = (i%8)-(j%8);
				d at(i,j) = 0;
				v at(i,j) = 0;
				u at(i,j) = 0;
				s[i] = 0;
				if (((x*x) + (y*y)) == 5) {
					d at(i,j) = 1;
					d at(i,j) = 1;
					v at(i,j) = rand()%2;
					v at(j,i) = v at(i,j);
				}
			}
		}

		sjl = SET(0);
		sjr = SET(0);
		for (int i = 0; i < 0x1000; i+=0x40) {
			sjl = ADD(LOAD(v+i), sjl);
			sjr = ADD(LOAD(v+i+0x20), sjr);
		}
		STORE(s, sjl);
		STORE(s+32, sjr);

//-----------------------------------------------------------------------------

		for (int x = 0; x < 0xb000; x++) { //45056
			sjln = SET(0);
			sjrn = SET(0);

			for (int i=0; i<0x1000; i+=64) {
				ft 	= SET((int8_t)(4 - s[i/64]));

				uil = LOAD(u+i);
				uir = LOAD(u+i+32);

				vil = LOAD(v+i);
				vir = LOAD(v+i+32);

				dil = LOAD(d+i);
				dir = LOAD(d+i+32);

				//u[i][j] += (4-s[i]-s[j])
				uil = ADD(uil, SUB(ft, sjl));
				uir = ADD(uir, SUB(ft, sjr));

				//v[i][j] = u[i][j] > 3 ? 1 : (u[i][j] >= 0 ? v[i][j] : 0)
				//(((u[i][j] & 0xfc)==0)&v[i][j]) | ((u[i][j] > 3)&d[i][j])
				viln = OR(AND(EQ(AND(uil, fc), _0), vil), AND(GT(uil, _3), dil));
				virn = OR(AND(EQ(AND(uir, fc), _0), vir), AND(GT(uir, _3), dir));

				sjln = ADD(viln, sjln);
				sjrn = ADD(virn, sjrn);

				STORE(v+i, viln);
				STORE(v+i+32, virn);
				
				STORE(u+i, uil);
				STORE(u+i+32, uir);
			}
			sjl = sjln;
			sjr = sjrn;
			STORE(s, sjln);
			STORE(s+32, sjrn);
		}

//-----------------------------------------------------------------------------

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

		if (sol_sum != 2080) //1+...+64
			continue;

		for (int i = 0; i < 64; i++) {
			ret[i] = ans[i];
		}
		break;
	}
	clock_t end = clock();
	int time_taken = (int)(((end-start)*1000)/CLOCKS_PER_SEC);
	ret[64] = time_taken;
	ret[65] = failed_runs;
}

int main() { 
	int ret[66];
	run(ret);
	for (int i = 0; i < 8; i++) {
		for (int j = 0; j < 8; j++) {
			printf("%2d ",ret[i*8+j]);
		}
		printf("\n");
	}
	printf("%d ms %d runs %f ms/run\n", ret[64], ret[65], (double)(ret[64])/(double)(ret[65]));
	// return ret[65]; //returns number of failed runs
}	
