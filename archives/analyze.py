import os
from random import randint

os.system("rm run ; rm runO3 ; gcc -o run -mavx2 simd.c ; gcc -o runO3 -mavx2 -O3 simd.c ;")

#took 92 minutes for 250 trials with 28 values of iterations (~1.25 seconds per run on average)
for j in range(250):
	print("\ntrial #{}".format(j))
	for i in [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]:
	#for i in [1,5,10,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,35,40,45,50,55,60,70,80,90]:
		print("{:>3}".format(i), end='\r')
		cmd = "./runO3 {} {} >> out.txt".format(randint(0,1<<64), i)
		os.system(cmd)

'''

'''