def word_condition(fname):
    x = []
    with open(fname,'r') as f:
        words = f.read().split()
    for i in words:
        if(len(i)>=10):
            for y in i:
                if y in ['Y','y','Z','z']:
                    x.append[i]
                    break
    return x
print(word_condition('abc.txt'))
