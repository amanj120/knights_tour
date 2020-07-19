#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define loop for(int i=0;i<64;i++)for(int j=i+1;j<64;j++)
#define min(a,b) ((a) < (b)) ? (a) : (b)
#define max(a,b) ((a) > (b)) ? (a) : (b)
#define abs(a) (a >= 0) ? (a) : (-1 * a)

int run() {

	static int d[64][64]; //Adjacency Matrix
	static int U[64][64]; //State
	static int V[64][64]; //Output
	static int c[64][64]; //Change in state

	loop { //Initialize
		int dx = (i/8)-(j/8);
		int dy = (i%8)-(j%8);
		d[i][j] = 0;
		U[i][j] = 0;
		V[i][j] = 0;
		c[i][j] = 0;
		if (((dx*dx)+(dy*dy))==5) {
			d[i][j] = 1;
			V[i][j] = rand() % 2;
		}
	}

	int iter = 0;
	while (1) {
		iter++;
		loop {
			if (d[i][j] == 1) {
				int del = 4;
				for (int k = 0; k < 64; k++) {
					int l1 = min(i,k); int l2 = min(j,k);
					int u1 = max(i,k); int u2 = max(j,k);
					del -= ((d[l1][u1] * V[l1][u1]) + (d[l2][u2] * V[l2][u2]));
				}
				c[i][j] = del;
			}
		}

		loop {
        	U[i][j] += c[i][j];
        	int U_val = U[i][j];
        	V[i][j] = (U_val > 3) + (U_val <=3 && U_val >= 0)*V[i][j];
        }

        if (iter % 1000 == 0) { //Testing ending conditions, pretty printing
    		int sum_dU = 0;
			int max_U = 0;

			loop {
				sum_dU += abs(c[i][j]);
				max_U = max(max_U, U[i][j]);
			}

			if (max_U > 1000 || iter > 250000) {
				return 0;
			}
		

			if (sum_dU == 0) {

				int total = 0;
				loop {	
					total += V[i][j];
				}
				if (total != 64) {
					return 0;
				}
	
				int starts[64];
				int ends[64];
				int solution[64];
				int edge_idx = 0;

				for (int i = 0; i < 64; i++) {
					starts[i] = 0; ends[i] = 0; solution[i] = 0;
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
				for (int s_i = 1; s_i < 64; s_i++) {
					for (int l = 0; l < 64; l++) {
						if (starts[l] == cur || ends[l] == cur) {
							int other = starts[l] == cur ? ends[l] : starts[l];
							if (solution[other] == 0) {
								solution[other] = s_i + 1;
								cur = other;
								break;
							}
						}
					}
				}

				int ret = 1; 
				printf("\n");
				for (int i = 0 ; i < 8; i++) {
					for (int j = 0; j < 8; j++) {
						printf("%*d ",2,solution[i*8+j]);
						if (solution[i*8+j] == 0) {
							ret = 0;
						}
					}
					printf("\n");
				}
				if (ret) {
					printf("Complete solution\n");
				} else {
					printf("Incomplete solution\n");
				}
				return ret;
			}
			if (iter % 25000 == 0) {
				printf("%d\r", (iter/25000)-1);
				fflush(stdout);
			}
        }
	}
}

int main() {
	srand(time(NULL)); //1595128014 (quick final), 1595128720 (quick non-final)for quick testing
	long start = time(0);	
	while(!run());
	long end = time(0);
	printf("time taken: %ld\n", end-start);
}