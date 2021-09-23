a = [1,2,3,4,5,6]

with open('abc.txt',mode = 'a') as f:
    for i in a:
        f.write(str(i))

with open('abc.txt') as f:
    for i in f.readlines():
        print(i)
