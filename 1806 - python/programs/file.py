def fread(fname):
    txt=open(fname)
    print(txt.read())

fread('abc.txt')
# Do not need to specify the whole path if it the file is in the same folder
print('1')
 
fread("C:\\Users\\Shraddha\\Desktop\\big data analytics\\abc.txt")
# USe double slash

print("2")
from itertools import islice
def fread_lines(fname, nlines):
    with open(fname) as f:
        for l in islice(f, nlines):
            print(l, end = '')

fread_lines('abc.txt',3)

print("3")
#rewrite
def fread_app(fname):
    with open(fname,'w') as f:
        f.write("A\nB\nC")
    t=open(fname)
    print(t.read())
fread_app('abc.txt')

print("4")    
def fread_list(fname):
    ar=[]
    with open(fname) as f:
        for line in f:
            ar.append(line)
    print(ar)
fread_list('abc.txt')

print('5')

def fread_list_1(fname):
    ar=[]
    with open(fname,'r') as f:
        l1=f.readlines()
        ar.append(l1)
    print (ar)
fread_list_1('abc.txt')
## readlines already gives list, therefore it gives doubl brackets.

def fread_list_2(fname):
    with open(fname,'r') as f:
        l1=f.readlines()
    print (l1)
fread_list_2('abc.txt')

## longest word
def longest_word(fname):
    with open(fname,'r') as f:
        words = f.read().split()
    maxlen=(max(words,key=len))
    return maxlen
print(longest_word('abc.txt'))

#count numer of lines
def f_nlines(fname):
    with open(fname) as f:
        for i,l in enumerate(f):
            pass
    return i+1
print(f_nlines('abc.txt'))
