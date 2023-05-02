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
Number = '''
201220856 201620843 201720239 201720472 201720485 201720553 201720831 201720928 201720932 201720973 201720974 201820079 201820182 201820304 201820813 201820814 201820823 201820827 201820833 201820837 201820840 201820847 201820860 201820873 201820893 201820894 201820901 201820905 201820921 201820925 201820928 201820931 201820932 201820937 201820938 201820942 201820954 201820958 201820967 201820973
 201820989 201820997  201820998 201821008  201821016 201821018 201821020  201821023  201821026  201821027  201821034 201821035 201821036 201821038  201821108 201821242  201821523 201823803  201923682  201923692  201923700 201923704  201923706  202020825 202020828 202020853  202020857  202020861 202020873  202020878  202020935 202020954 202020967  202021015  202021029 202021036  202021037  202021251
'''.replace("\n", "").split(" ")
ns = []
final = []

for list in lists:
    if(list):
        final.append(int(list))

for n in Number:
    if(n):
        ns.append(n)

fin = []

a = '''10
8
65
70
0
50
27
48
62
0
54
36
84
34
85
42
48
47
44
0
69
73
83
52
24
52
26
66
48
5
68
86
82
62
73
52
47
5
64
54
62
62
0
55
59
61
53
41
46
72
76
41
54
87
28
61
66
0
0
10
40
29
26
0
65
33
15
68
42
61
7
59
68
27
51
71
77
29'''.replace("\n", " ").split(" ")
for n, i in enumerate(a):
    fin.append(int(i))


last = {}
for i in range(78):
    last[ns[i]] = [0.3 * final[i] + 0.5 * fin[i]]

sorted_dict = sorted(last.items(), key=lambda item: item[1], reverse=True)
for n, s in enumerate(sorted_dict):
    print(n, ":", s)
