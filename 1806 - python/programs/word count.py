# count the number of words

from collections import Counter
def wcount(fname):
    with open (fname) as f:
        return Counter(f.read().split())

print('total words in a file:', wcount("th.txt"))

# count the number of lines

def linecount(fname):
    with open (fname) as f:
        for i,l in enumerate(f):
            pass
        return i+1
