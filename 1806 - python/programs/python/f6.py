##writing a new file
##zip-function

courses=['bca','bsc','bda']
with open('course.txt',"w") as f:
    for c in courses:
        f.write("%s\n"%c)

cont=open('course.txt')
print(cont.readlines())
