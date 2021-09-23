def fread_append(fname):
    from itertools import islice
    with open(fname,"w") as f:
        f.write("abcd\n")
        f.write("efgh")
    t=open(fname)
    print(t.read())

fread_append('a.txt')

#insert in arryay
def fread_list(fname):
    ar=[]
    with open(fname) as f:
        for line in f:
            ar.append(line)
        print(ar)

fread_list('a.txt')
