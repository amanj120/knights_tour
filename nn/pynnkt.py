from random import randint
import numpy as np
from numba import njit, vectorize
import time

# @vectorize
# def set_v(v, u):
# 	return ((u > 3) * 1) + ((u >= 0 and u <= 3) * v)

# @vectorize
# def add(v, u):
# 	return (u+v)

@njit
def run(N):
	N2 = N*N
	d = np.zeros((N2,N2), dtype=np.int64)
	V = np.zeros((N2,N2), dtype=np.int64)
	U = np.zeros((N2,N2), dtype=np.int64)
	dU = np.zeros((N2,N2), dtype=np.int64)
	iteration = 0

	for i in range(N2):
		for j in range(i+1,N2):
			a = (i//N, i%N)
			b = (j//N, j%N)
			if ((a[0]-b[0])**2 + (a[1]-b[1])**2) == 5:
				d[i][j] = 1
				V[i][j] = randint(0,1)
	#             print("{} -> {}".format(a,b))
	while True:
		iteration += 1

		for i in range(N2):
			for j in range(i+1,N2):
				if d[i][j] == 1:
					dU[i][j] = 4
					for k in range(N2):
						l1 = min(i,k)
						l2 = min(j,k)
						u1 = max(i,k)
						u2 = max(j,k)
						dU[i][j] -= ((d[l1][u1] * V[l1][u1]) + (d[l2][u2] * V[l2][u2]))


		np.add(U, dU, U)  
		# V = set_v(V,U)    
		for i in range(N2):
			for j in range(i+1,N2):
				# U[i][j] += dU[i][j]
				U_val = U[i][j]
				V[i][j] = ((U_val > 3) * 1) + ((U_val >= 0 and U_val <= 3) * V[i][j])
			
		if iteration % 1000 == 0:
			if not np.any(dU):
				# print(iteration)
				break
			if np.max(U) > 500:
				return None
			if iteration > 250000:
				return None
			# if iteration % 10000 == 0:
			# 	print(iteration//10000, '\r')

	soln = []

	for i in range(N2):
		for j in range(i+1,N2):
			if V[i][j] == 1:
				soln.append((i,j))

	return soln

def get_complete():
	time_start = time.time()
	N = 8
	soln = []
	while True:
		soln = run(N)
		if soln != None:
			# print("solution length: {}\nsolution: {}".format(len(soln), soln))

			solution = np.zeros((N*N), dtype=np.int32)
			solution[0] = 1
			cur = 0
			for i in range(1,(N*N)):
				idx = i + 1
				for l in soln:
					if cur in l:
						other = l[0] if l[1] == cur else l[1]
						if solution[other] == 0:
							solution[other] = idx
							cur = other
							break
						
			if 0 not in solution:
				for i in range(N):
					print()
					for j in range(N):
						print(str(solution[i*N+j]).rjust(2), end= ' ')
				total_time = int(time.time() - time_start)
				print("\nComplete solution took {} seconds".format(str(total_time)))
				return total_time
				break
			else:
				print('I', end = ' ')
		else:
			print('D', end = ' ')


if __name__ == '__main__':
	l = []
	for i in range(25):
		l.append(get_complete())
	print(l)