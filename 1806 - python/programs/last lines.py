def LastNlines(fname, N): 
    with open(fname) as file: 
        for line in (file.readlines() [-N:]): 
            print(line, end ='')

LastNlines('abc.txt',5)


def lines(fname, N): 
    with open(fname) as file:
        x = file.readlines()
        for line in x[::2]: 
            print(line, end ='')

lines('abc.txt',5)
