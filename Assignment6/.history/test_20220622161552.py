from ctypes import sizeof


mem_cell = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
size = len(mem_cell)

t1 = 0
t2 = 0
t3 = 0
for n in range(size):
    for i in range(1, size-n):
        print(i, i+1, mem_cell)
        t1 = mem_cell[i]
        t2 = mem_cell[i+1]
        if(t1 > t2):
            mem_cell[i] = t2
            mem_cell[i+1] = t1
