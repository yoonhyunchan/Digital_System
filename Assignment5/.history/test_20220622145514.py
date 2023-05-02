from ctypes import sizeof


mem_cell = [1, 9, 2, 3, 5, 10, 7, 6, 4, 8]
size = len(mem_cell)

t1 = 0
t2 = 0
t3 = 0
for n in range(size):
    for i in range(n, size-1):
        t1 = mem_cell[i]
        t2 = mem_cell[i+1]
        if(t1 > t2):
            mem_cell[i] = t2
            mem_cell[i+1] = t1
            print(n, i)
print(mem_cell)
