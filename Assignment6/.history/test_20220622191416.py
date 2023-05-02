from ctypes import sizeof


mem_cell = [0, 0, 0, 10, 0, 0, 0, 9, 0, 0, 0, 8, 0, 0, 0, 7, 0, 0,
            0, 6, 0, 0, 0, 5, 0, 0, 0, 4, 0, 0, 0, 3, 0, 0, 0, 2, 0, 0, 0, 1]
for i, j in enumerate(mem_cell):
    print(j)
    if(i % 4 == 3):
        print("\n")
a1_size = 10

t0 = 0
t1 = 0
t2 = 0
