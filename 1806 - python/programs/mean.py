def mean():
    sum=0
    count=0
    while True:
        s1=input("enter a number or \"done\":")
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

# print(mean())

def harmonic_mean():
    sum=0
    count=0
    while True:
        s1=input("enter a number or \"done\":")
        if s1=='done':
            if count==0:
                print("no numbers entered")
                return 0
            else:
                return count/sum
        else:
            try:
                sum+=1/float(s1)
                count+=1
            except ValueError:
                print("invalid entry")
            except ZeroDivisionError:
                print("cannot find harmonic mean if an input is zero")

print(harmonic_mean())

