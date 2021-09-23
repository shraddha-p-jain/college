n1 = int(input("Enter number:"))
fact = 1
if n1<0:
    print("Error:negative number")
else:
    for i in range(2, n1+1):
        fact = fact*i

    print("factorial:", fact)
