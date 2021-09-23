def f_num(fname):
    with open(fname) as f:
        for i, l in enumerate(f):
            pass
    return i+1

print(f_num('a.txt'))
