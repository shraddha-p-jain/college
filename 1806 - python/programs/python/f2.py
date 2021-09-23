def fread_lines(fname, nlines):
    from itertools import islice
    with open(fname) as f:
        for l in islice(f,nlines):
            print(l)

fread_lines('a.txt',2)
