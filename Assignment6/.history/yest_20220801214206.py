question = input("더하기 빼기 곱하기 나누기 고르시오")
n1 = input("첫번째 숫자")
n2 = input("두번째 숫자")
if question == "더하기":
    print(f"{n1} + {n2} = {int(n1) + int(n2)}")
elif question == "빼기":
    print(f"{n1} - {n2} = {int(n1) - int(n2)}")
elif question == "곱하기":
    print(f"{n1} * {n2} = {int(n1) * int(n2)}")
elif question == "나누기":
    print(f"{n1} / {n2} = {int(n1) / int(n2)}")
