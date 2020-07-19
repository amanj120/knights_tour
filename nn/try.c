#include <stdio.h> 
#include <stdlib.h>
#include <time.h>
#define loop for(int i=0;i<64;i++)for(int j=i+1;j<64;j++)
#define min(a,b) ((a)<(b))?(a):(b)
#define max(a,b) ((a)>(b))?(a):(b)


                          int
                          lci=0; 
                         int x(){
                         static int
                        d[64][64];char
                      *lh="-+#@#+- ";static int 
                     U[64][64];static int V[64][64
                   ];static int c[64][64];loop{int dx
                 =(i/8)-(j/ 8);int dy=(i%8)-(j%8);d[i]
                 [j]=0;U[i][j]=0;V[i][j]=0;c[i][j]=0;if(
              ((dx*dx)+(dy*dy))==5){d[i][j]=1;V[i][j]=rand
           ()%2;}}int iter = 0;while(1){iter++;loop{if(d[i]
         [j]==1){int dl=4;for(int k=0;k<64;k++){int l1=min(
        i,k);int l2=min(j,k);int u1=max(i,k);int u2=max(j,k
       );dl-=((d[l1][u1]*V[l1][u1])+(d[l2][u2]*V[l2][u2]));
    }c[i][j]=dl;}}loop{U[i][j]+=c[i][j];int U_v=U[i][j];V[i
   ][j]=(U_v<=3&&U_v>=0)*V[i][j]+(U_v>3);}if(iter%1000==0){
   int sdu=0;int max_U=0;loop{sdu += (c[i][j]*(-1^(c[i][j]<
    0)));max_U=max(max_U,U       [i][j]);} if (max_U>1000||
    iter>250000){return 0       ;}lci=(lci+1)%8;printf("Lo"
    "oking for a Tour "        "%c%c%c\r",lh[(lci+2)%8],lh[
      (lci+1)%8],             lh[lci]);fflush(stdout);if(0-
        sdu                  ==0){int tot=0;loop{tot+=V[i][
                            j];}if(tot!=64)return 0;int sxt
                          [64];int exd[64];int sol[64];int
                         e_ix=0;for(int i=0;i<64;i++){sxt[
                       i]=0;exd[i]=0;sol[i]=0;}loop{if(V[i
                     ][j]==1){sxt[e_ix]=i;exd[e_ix]=j;e_ix
                   ++;}}sol[0]=1;int cur=0;for(int si=1;si
                  <64; si++){for(int l=0;l<64;l++){if(sxt
                   [l]==cur||exd[l]==cur){int oth=(sxt[l
                    ]==cur?exd[l]:sxt[l]);if(sol[oth]==
                     0){sol[oth]=si+1;cur=oth;break;}}
                       }}for(int i=0;i<64;i++){if(sol
                        [i]==0){return 0;}}for(int i

                      =0;i<8;i++){printf("\n");for(int 
                     j=0;j<8;j++)printf("%*d ",2,sol[i*
                    8+j]);}return 1;}}}} int main(){long
                   s=time(0);srand(s);while(!x());printf(
                    "\nTime: %lds\n",time(0)-s);}//-Aman