mem_cell = [0, 0, 0, 10, 0, 0, 0, 9, 0, 0, 0, 8, 0, 0, 0, 7, 0, 0,
            0, 6, 0, 0, 0, 5, 0, 0, 0, 4, 0, 0, 0, 3, 0, 0, 0, 2, 0, 0, 0, 1]
a1_size = 40

t0 = 0
t1 = 0
t2 = 0

while True:

    t1 = mem_cell[t0]
    t2 = mem_cell[t0 + 4]
    if(t1 > t2):
        mem_cell[t0] = t2
        mem_cell[t0+1] = t1
