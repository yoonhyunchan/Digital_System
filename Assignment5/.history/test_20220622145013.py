from ctypes import sizeof


mem_cell = [1, 9, 2, 3, 5, 10, 7, 6, 4, 8]
size = len(mem_cell)

t1, t2 = 0
t3 = 0
for i in size-1:
    t1 = mem_cell[i]
    t2 = mem_cell[i+1]
    if(t1 > t2):