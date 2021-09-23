# read file into a string

def read_file(fname):
    with open(fname) as f:
        x = f.read()
        print(x)
    print(type(x))
read_file('abc.txt')

# read file into a list

def read_file_list(fname):
    with open(fname) as f:
        x = f.readlines()
        print(x)
    print(type(x))
read_file_list('abc.txt')
