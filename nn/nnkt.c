#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define loop for(int i = 0; i < N2; i++) for(int j = i + 1; j < N2; j++)
#define min(a,b) ((a) < (b)) ? (a) : (b)
#define max(a,b) ((a) > (b)) ? (a) : (b)
#define abs(a) (a >= 0) ? (a) : (-1 * a)

int run(int N) {
	int N2 = N*N;
	int d[N2][N2];
	int dU[N2][N2];
	int V[N2][N2];
	int U[N2][N2];
	int iteration = 0;

	loop { //Initialize
		int dx = (i/N) - (j/N);
		int dy = (i%N) - (j%N);
		U[i][j] = 0;
		dU[i][j] = 0;
		if ( ((dx*dx) + (dy*dy)) == 5 ) {
			d[i][j] = 1;
			V[i][j] = rand() % 2;
		} else {
			d[i][j] = 0;
			V[i][j] = 0;
		}
	}

	while (1) {
		iteration++;
		loop {
			if (d[i][j] == 1) {
				int delta = 4;
				for (int k = 0; k < N2; k++) {
					int l1 = min(i,k);
					int l2 = min(j,k);
					int u1 = max(i,k);
					int u2 = max(j,k);
					delta -= ((d[l1][u1] * V[l1][u1]) + (d[l2][u2] * V[l2][u2]));
				}
				dU[i][j] = delta;
			} else {
				dU[i][j] = 0;
			}
		}

		loop {
        	U[i][j] += dU[i][j];
        	int U_val = U[i][j];
        	V[i][j] = (U_val > 3) + (U_val <=3 && U_val >= 0)*V[i][j];
        }

		if (iteration % 1000 == 0) {
			int sum_dU = 0;
			int max_U = 0;
			loop {
				sum_dU += abs(dU[i][j]);
				max_U = max(max_U, U[i][j]);
			}
			if (sum_dU == 0) {
				int total = 0;
				loop {
					if (V[i][j] == 1) {
						total++;
					}
				}
				printf("total edges: %d\n", total);
				if (total != N2) {
					return 0;
				}
				int starts[N2];
				int ends[N2];
				int solution[N2];
				int edge_idx = 0;
				for (int i = 0; i < N2; i++) {
					starts[i] = 0;
					ends[i] = 0;
					solution[i] = 0;
				}
				loop {
					if (V[i][j] == 1) {
						starts[edge_idx] = i;
						ends[edge_idx] = j;
						edge_idx++;
					}
				}

				solution[0] = 1;
				int cur = 0;
				for (int s_i = 1; s_i < N2; s_i++) {
					int idx = s_i + 1;
					for (int l = 0; l < N2; l++) {
						if (starts[l] == cur || ends[l] == cur) {
							int other = starts[l] == cur ? ends[l] : starts[l];
							if (solution[other] == 0) {
								solution[other] = idx;
								cur = other;
								break;
							}
						}
					}
				}
				int ret = 1; 
				for (int i = 0 ; i < N; i++) {
					for (int j = 0; j < N; j++) {
						printf("%*d ",2,solution[i*N+j]);
						if (solution[i*N+j] == 0) {
							ret = 0;
						}
					}
					printf("\n");
				}
				return ret;
			}

			if (iteration % 25000 == 0) {
				printf("%d\n", iteration/25000);
			}

			if (max_U > 1000) {
				return 0;
			}

			if (iteration > 250000) {
				return 0;
			}
		}
    }
}

int main(int argc, char **argv) {
	//help menu
	long seed = time(NULL);
	printf("seed = %ld\n", seed);
	srand(seed);
	int N = 8;
	if (argc > 1) {
		if(strcmp(argv[1], "-h") == 0 || strcmp(argv[1], "--help") == 0){
			printf("Use '-s N' or '--size N' to specify size of board for knights tour\n");
			return 0;
		} else if(argc == 3 && (strcmp(argv[1], "-s") == 0 || strcmp(argv[1], "--size") == 0)) {
			N = atoi(argv[2]);
			if (N < 5) // TODO: check to make sure board size is possible
				N = 8;
		} else {
			printf("Not a valid input\n");
			return 0;
		}
	}
	printf("Running Knight's Tour on a %dx%d board\n", N, N);

	while(!run(N));
	return 0;
}