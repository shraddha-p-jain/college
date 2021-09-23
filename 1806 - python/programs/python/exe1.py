def mean():
    sum=0
    count=0
    while True:
        s1=input("enter a number or \"Done\":")
        if s1=='done':
            if count==0:
                print("no numbers entered")
                return 0
            else:
                return sum/count
        else:
            try:
                sum+=int(s1)
                count+=1
            except ValueError:
                print("invalid entry")

print(mean())        
