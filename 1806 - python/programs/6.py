'''
n = int(input("Enter number:"))
flag = 1
if n>1:
    for i in range(2,n//2+1):
        if(n%i==0):
            print("not prime")
            break
    else:
        print("prime")
else:
    print("error")

'''

n = int(input("Enter number:"))
flag = 1
if n>1:
    for i in range(2,n):
        if(n%i==0 and n!=2):
            print("not prime")
            break
        if n==2 or i==n-1:
            print("prime")
else:
    print("error")

'''
n=int(input("Enter number: "))
if n>1:
    for i in range(2,n):
        if(n%i)==0:
            print(n,"is not a prime number")
            break
    else:
        print(n,"is a prime number")
else:
    print(n,"Error")

'''
'''
n=int(input("Enter a number: "))
if n==0 or n==1:
    print("Not a Prime no.")
elif n<0:
    print("Error")
else:
    prime=1
    for i in range(2,n//2+1):
        if n%i==0:
            prime=0
            break
    if prime:
        print("Prime no.")
    else:
        print("Not a Prime no.")

'''
