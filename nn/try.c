#define loop for(int i=0;i<64;i++)for(int j=i+1;j<64;j++)
#define min(a,b) (a<b?a:b)
#define max(a,b) (a>b?a:b)
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <math.h>
                        int
                        li=0; 
                       int x(){
                       static int
                      d[64][64];char
                    *lh="-+#@#+- ";static int 
                   U[64][64];static int V[64][64
                 ]; static int c[64][64];loop{int 
               dx=(i/8)-(j/ 8);int dy=(i%8)-(j%8);
              d[i][j]=0;U[i][j]=0;V[i][j]=0;c[i][j]
           =0;if(((dx*dx)+(dy*dy))==5){d[i][j]=1;V[i
         ][j]=rand()%2;}}int iter = 0;while(1){iter++
       ;loop{if(d[i][j]==1){int dl=4;for(int k=0;k<64;
      k++){int l1=min(i,k);int l2=min(j,k);int u1=max(
     i,k);int u2=max(j,k);dl-=((d[l1][u1]*V[l1][u1])+(d
  [l2][u2]*V[l2][u2]));}c[i][j]=dl;}}loop{U[i][j]+=c[i][
 j];int uv=U[i][j];V[i][j]=(uv<=3&&uv>=0)*V[i][j]+(uv>3)
 ;}if(iter%1000==0){int sdu=0;int mxu=0;loop{sdu += abs(c
 [i][j]);mxu=max(mxu,U[i]     [j]);}/**/if(mxu>1000||iter
   >250000){return           0;}li=(li+1)%8;printf("Look"
    "ing for a "            "Tour %c%c%c\r",lh[(li+2)%8],
     lh[(li+1)             %8],lh[li]);fflush(stdout);if(
        sdu              ==0){int tot=0;loop{tot+=V[i][j]
                        ;}if(tot!=64)return 0;int sxt[64
                       ];int exd[64];int sol[64];int ex=
                      0;for(int i=0;i<64; i++){sxt[i]=0;
                    exd[i]=0;sol[i]=0;}loop{if(V[i][j]==
                   1){sxt[ex]=i;exd[ex]=j;ex++;}}sol[0]=
                  1;int cur=0;for(int q=1;q<64;q++){for
                 (int l=0;l<64;l++){if(sxt[l]==cur||exd
                  [l]==cur){int oth=(sxt[l]==cur?exd[
                   l]: sxt[l]); if(sol[oth]==0){sol[
                    oth]=q+1;cur=oth;break;}}}}for(
                     int i=0;i<64;i++){if(sol[i]==
                    

                    0){return 0;}}for(int i=0;i<8;i
                   ++){ printf("\n");for(int j=0;j<8
                  ;j++)printf("%*d ", 2,sol[i*8+j]);}
                 return 1;}}}}void main(){long s=time(
                  0);srand(s);while(!x());long t=time
                   (0)-s;printf("\nTime:%lds\n",t);}
                 
/*-----------Written By Aman Jain, July 2020-----------*/