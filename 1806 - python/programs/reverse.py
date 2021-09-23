x = input("Enter a string")
def reverse_words(x):
    a = x.split()
    y = " ".join(a[::-1])
    return y

def reverse_char(x):
    y = x[::-1]
    return y

print(reverse_words(x))
print(reverse_char(x))
