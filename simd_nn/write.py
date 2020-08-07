from ctypes import *
from os import path
func = CDLL(path.abspath('k.so')).run
f = open("sols.txt", "a", 1)
chars = '#0123456789@ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
nums = (c_int*66)()
while True:
    #print(i, end="\r")
    func(nums)
    s = ''.join([chars[i-1] for i in list(nums)[:64]])
    f.write(s)
    f.write("\n")
f.close()
