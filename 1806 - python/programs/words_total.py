def f_words(fname):
    with open(fname) as f:
        words = f.read().split()
    return len(words)
print(f_words('abc.txt'))

def f_char(fname):
    with open(fname) as f:
        txt = f.read()
    return len(txt)
print(f_char('abc.txt'))
