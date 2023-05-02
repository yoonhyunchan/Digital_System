from ctypes import sizeof


mem_cell = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
size = 10

t0 = 0
t1 = 0
t2 = 0
a1 = 10

while(True):
    # TLOOP
    t0 = 0
    if(t0 == a1):  # a1 = 40
        break
    else:
        while(True):
            t1 = mem_cell[t0]
            t2 = mem_cell[t0+1]
            if(t1 > t2):
                mem_cell[t0] = t2
                mem_cell[t0+1] = t1
            t0 = t0 + 1
            if t0 == a1:
                break
            else:
print(mem_cell)
