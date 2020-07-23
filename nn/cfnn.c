#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <stdint.h>
#include <time.h>

#define I for(int i=0;i<64;i++)
#define J for(int j=0;j<64;j++)
#define R 350000

int main() {
	srand(time(0));

	uint8_t d[64][64]; //adjacency matrix
	uint8_t v[64][64]; //output
	int8_t u[64][64]; //state
	uint8_t s[64];     //sums

	for(int i=0;i<64;i++) {
		for(int j=0;j<64;j++) { //initialize
			int x = (i/8)-(j/8);
			int y = (i%8)-(j%8);
			d[i][j] = 0;
			v[i][j] = 0;
			u[i][j] = 0;
			s[i] = 0;
			if (((x*x) + (y*y)) == 5) {
				d[i][j] = 1;
				d[j][i] = 1;
				v[i][j] = rand()%2;
				v[j][i] = v[i][j];
			}
		}
	}

	/*-------------------*/
	for(int c=0;c<R;c++){
		for(int i=0;i<64;i++){
			s[i]=0;
			for(int j=0;j<64;j++) {
				s[i]+=v[i][j];
			}
		}
		for(int i=0;i<64;i++){
			for(int j=0;j<64;j++){
				if(d[i][j]){
					u[i][j]+=(4-s[i]-s[j]);
					if(u[i][j]>3){
						v[i][j]=1;
					}
					if(u[i][j]<0){
						v[i][j]=0;
					}
				}
			}
		}	
	}
	/*-------------------*/

	printf("s = [");
	I {
		J {
			if (v[i][j]) {
				printf("(%d,%d),",i,j);
			}
		}
	}
	printf("]\n");
}