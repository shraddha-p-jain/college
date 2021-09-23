x = input("enter a number: ")
l = len(x)
x1 = int(x)
s = 0
for y in x:
    y1=int(y)
    s+=pow(y1,l)

if s==x1:
   #str(s)==x:
   #s==int(x): 
    print("{0} is an armstrong number".format(x1))
else:
    print("{0} is not an armstrong number".format(x1))

#while(x!=0):
 #   r = x%10
