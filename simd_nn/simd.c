#include <stdio.h>
#include <stdint.h>
#include <immintrin.h>
#include <time.h>
#include <sys/time.h>

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

	struct timeval tp;
	gettimeofday(&tp, NULL);
	long int ms = tp.tv_sec * 1000 + tp.tv_usec / 1000;
	srand(ms); 

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
					d at(i,j) = 0xFF;
					d at(i,j) = 0xFF;
					v at(i,j) = rand()%2;
					v at(j,i) = v at(i,j);
				}
			}
		}

		for (int x = 0; x < 0xb000; x++) { //45056
			sjl 		= SET(0);
			sjr 		= SET(0);
			for (int i = 0; i < 0x1000; i+=0x80) {
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

			for (int i=0; i<0x1000; i+=0x40) {
				ft 		= SET((int8_t)(4 - s[i/64]));

				dil 	= LOAD((__m256i *)(d+i));
				dir 	= LOAD((__m256i *)(d+i+0x20));

				uil_pre = LOAD((__m256i *)(u+i));
				uir_pre = LOAD((__m256i *)(u+i+0x20));
				
				uil 	= SUB(ft, sjl);
				uir 	= SUB(ft, sjr);
				
				uil 	= ADD(uil_pre, uil);
				uir 	= ADD(uir_pre, uir);
				
				uil 	= AND(dil, uil);
				uir 	= AND(dir, uir);
				
				vil 	= LOAD((__m256i *)(v+i));
				vir 	= LOAD((__m256i *)(v+i+0x20));
				
				uilgt3 	= CMPGT(uil, three);
				uirgt3 	= CMPGT(uir, three);
				
				uilfc 	= AND(uil, fc);
				uirfc 	= AND(uir, fc);
				
				uilin 	= CMPEQ(uilfc, zero);
				uirin 	= CMPEQ(uirfc, zero);
				
				keepvl 	= AND(uilin, vil);
				keepvr 	= AND(uirin, vir);
				
				onevl_t = AND(uilgt3, dil);
				onevr_t = AND(uirgt3, dir);
				
				onevl 	= AND(onevl_t, one);
				onevr 	= AND(onevr_t, one);
				
				newvl 	= OR(keepvl, onevl);
				newvr 	= OR(keepvr, onevr);
				
				STORE((__m256i_u *)(v+i), newvl);
				STORE((__m256i_u *)(v+i+0x20), newvr);
				
				STORE((__m256i_u *)(u+i), uil);
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

		if (sol_sum != 2080 /*1+...+64*/ )
			continue;

		for (int i = 0; i < 8; i++) {
			for (int j = 0; j < 8; j++) {
				printf("%2d ", ans[i*8+j] - 1);
			}
			printf("\n");			
		}
		break;
	}
	clock_t end = clock();
	int time_taken = (int)(((end-start)*1000)/CLOCKS_PER_SEC);
	// double per_iter = ((double)(end-start)*100000000)/((double)(47703) * failed_runs * CLOCKS_PER_SEC);
	// printf("%d ms %d runs %.1f ns per iter\n", time_taken, failed_runs, per_iter);
	printf("%d ms %d runs\n", time_taken, failed_runs);
}
