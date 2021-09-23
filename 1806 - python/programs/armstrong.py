import math
x = int(input("Enter a number: "))
def armstrong(a):
    str_a = str(a)
    l = len(str_a)
    sum = 0
    for i in str_a:
        sum += math.pow(int(i),l)
    if sum==a:
        return True
    else:
        return False

print(armstrong(x))
