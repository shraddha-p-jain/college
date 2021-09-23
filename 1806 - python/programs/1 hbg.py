from collections import Counter
def wcount(fname):
    with open (fname) as f:
        return Counter(f.read().split())

print('total words in a file:',wcount("abc.txt"))
