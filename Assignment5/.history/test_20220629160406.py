

lists = """
 0
70
1
30
32 
0
78
58
20
70
47
1
74
3
25
14
14
13
43
10
44
0
55
27
39
50
7
62
33
4
45
69
52
11
34
49
76
74
70
31
22
79
42
30
4
54
20
43 
14  63  18  7  32  20  10  10  23  10  57  13  10  14  34  77  80  51  62  23  24  57  10  20  0  59  28  0  0  0  20  0  23  70 
""".replace('\n', ' ').split(' ')
final = []
for list in lists:
    if(list):
        final.append(list)
# final = final.sort()
print(final)
