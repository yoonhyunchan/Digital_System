from ctypes import sizeof


mem_cell = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
size = 10

t1 = 0
t2 = 0
t3 = 0
for n in range(size-1):  # 0 ~ 8(size - 2)
    for m in range(1):
        print(n, m)
