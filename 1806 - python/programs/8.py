r = int(input("enter range:"))
for i in range(r+1):
    x=(str(i))
    l=len(x)
    s=0
    for y in x:
        y1 = int(y)
        s+=pow(y1,l)
    if s==i:
        print(i)
    
