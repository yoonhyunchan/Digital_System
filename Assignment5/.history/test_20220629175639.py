
lists = """
7
4
25
64
4
64
41
30
58
0
53
35
78
53
83
51
77
42
42
0
38
64
62
61
45
93
6
74
46
33
100
72
55
42
70
38
15
0
88
37
82 
60 
0 
37 
46
65 
44 
27 
45 
58 
10
0
52 
75
20 
56 
68 
9 
10 
3 
39
34 
43 
11 
43
26 
17 
37
59 
31 
22 
64 
33 
17 
49
73 
50
31
""".replace('\n', ' ').split(' ')
final = []
for list in lists:
    if(list):
        final.append(int(list))
final.sort(reverse=True)
for n, i in enumerate(final):
    print(n, i)
