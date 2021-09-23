##counting number of lines,words and letters
##see ifalpha function

import string
def count_an():
    nlines, nwords, nletters=0,0,0
    with open('a.txt') as f:
        for line in f:
            nlines+=1
            nwords+=len(line.split())
            for letter in line:
                if letter in string.ascii_letters:
                    nletters+=1
    return nlines,nwords,nletters

print(count_an())
