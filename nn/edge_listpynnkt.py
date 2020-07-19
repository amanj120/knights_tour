from random import randint
import numpy as np
from numba import njit

# @njit
def run(N):
    assert N >= 6 and N %2 == 0
    num_edges = 4 * (N-1) * (N-2)
    N2 = N*N
    vertices = [(i,j) for i in range(N) for j in range(N)]
    edges = np.zeros((num_edges,5), dtype=np.int64) #[start_vertex, finish_vertex, U, dU, V]
    start = 0
    end = 1
    U = 2
    dU = 3
    V = 4
    edge_index = 0
    iteration = 0
    neighbors = {}

    for i in range(N2):
        for j in range(i+1, N2):
            if (((vertices[i][0]-vertices[j][0])**2 + (vertices[i][1]-vertices[j][1])**2) == 5):
                edges[edge_index][start] = i
                edges[edge_index][end] = j
                edges[edge_index][V] = randint(0,1)
                edge_index += 1
    
    for i in range(num_edges):
        i_neighbors = []
        for j in range(num_edges):
            if ((edges[j][start] == edges[i][start]) or (edges[j][end] == edges[i][start]) or (edges[j][start] == edges[i][end]) or (edges[j][end] == edges[i][end])):
                i_neighbors.append(j)
        i_neighbors.append(i)
        neighbors[i] = i_neighbors

    print(neighbors)
                
    assert edge_index == num_edges
        
    while True:
        iteration += 1
        
        for i in range(num_edges):
            edges[i][dU] = 4 - edges[i][V]
            for j in range(num_edges):
                if ((edges[j][start] == edges[i][start]) or (edges[j][end] == edges[i][start]) or (edges[j][start] == edges[i][end]) or (edges[j][end] == edges[i][end])):
                    edges[i][dU] -= edges[j][V]
        
        for e in edges:
            e[U] += e[dU]
            e[V] = (1 * (e[U] > 3)) + (e[V] * (e[U] <= 3 and e[U] >= 0))
        
        stable = True
        for e in edges:
            if e[dU] != 0:
                stable = False
        
        if stable:
            break
            
        if iteration % 10000 == 0:
            print(iteration//10000)
        
        # print(max(np.abs(edges[...,U])), end = '\r')
        
    soln = []

    for i in range(num_edges):
        if edges[i][V] == 1:
                soln.append((edges[i][start], edges[i][end]))

    return soln

if __name__ == '__main__':
    N = 8
    soln = []
    while True:
        soln = run(N)
        if soln != None:
            print("solution length: {}\nsolution: {}".format(len(soln), soln))

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
                        
            for i in range(N):
                for j in range(N):
                    print(str(solution[i*N+j]).rjust(2), end= ' ')
                print()
            print()

            if 0 not in solution:
                print("Complete solution")
                break    
