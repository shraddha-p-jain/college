def fread_list(fname):
    ar=[]
    with open(fname,"r") as f:
        l1=f.readlines()
        print(l1)

fread_list('a.txt')

#longest word in file
def long_word(filename):
    with open(filename, 'r') as f:
        words=f.read().split()
    maxlen=(max(words,key=len))
    return maxlen

print(long_word('a.txt'))
