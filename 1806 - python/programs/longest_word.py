def longest_word(fname):
    x = []
    with open(fname,'r') as f:
        words = f.read().split()
    maxlen=(max(words,key=len))
    return maxlen
print(longest_word('abc.txt'))
