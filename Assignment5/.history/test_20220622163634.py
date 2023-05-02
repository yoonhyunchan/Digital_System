from ctypes import sizeof


mem_cell = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
size = 10

t1 = 0
t2 = 0
t3 = 0
for n in range(size-1):
    for i in range(0, size-n-1):
        print(i, i+1)
        t1 = mem_cell[i]
        t2 = mem_cell[i+1]
        if(t1 > t2):
            mem_cell[i] = t2
            mem_cell[i+1] = t1
    print(mem_cell)
