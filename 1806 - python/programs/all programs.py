## 1. factorial

x = int(input("Enter a number: "))
def factorial(a):
    fact = 1
    for i in range(1,a+1):
        fact = fact*i
    return fact

print(factorial(x))

## 2. armstrong function

import math
x = int(input("Enter a number: "))
def armstrong(a):
    str_a = str(a)
    l = len(str_a)
    sum = 0
    for i in str_a:
        sum += math.pow(int(i),l)
    if sum==a:
        return True
    else:
        return False

print(armstrong(x))

## 3. palindrome

x = input("Enter a number")
def palindrome(s):
    rev = s[::-1]
    if s.lower()==rev.lower():
        return True
    else:
        return False


## 4. fibonacci

def fibonacci(n):
    a=0
    b=1
    c=0
    while c<=n:
        print(c, end = ' ')
        a=b
        b=c
        c=a+b

fibonacci(300)

## 5. prime

## 6. reverse words and chars
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

## 7. write into a file, read the number of lines, words, chars

#count numer of lines
def f_nlines(fname):
    with open(fname) as f:
        for i,l in enumerate(f):
            pass
    return i+1
print(f_nlines('abc.txt'))

#count the number of words
def f_words(fname):
    with open(fname) as f:
        words = f.read().split()
    return len(words)
print(f_words('abc.txt'))

# count chars
def f_char(fname):
    with open(fname) as f:
        txt = f.read()
    return len(txt)
print(f_char('abc.txt'))

## 8. list of words on a condition:

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

## 9.   read first n lines:

def file_read_from_head(fname, nlines):
        from itertools import islice
        with open(fname) as f:
                for line in islice(f, nlines):
                        print(line)
file_read_from_head('test.txt',2)

## last n lines

def LastNlines(fname, N): 
    with open(fname) as file: 
        for line in (file.readlines() [-N:]): 
            print(line, end ='')

LastNlines('abc.txt',5)

## Skip every second line
def lines(fname, N): 
    with open(fname) as file:
        x = file.readlines()
        for line in x[::2]: 
            print(line, end ='')

lines('abc.txt',5)



## 10. read a file and store it into a variable

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

## 11. longest word

def longest_word(fname):
    x = []
    with open(fname,'r') as f:
        words = f.read().split()
    maxlen=(max(words,key=len))
    return maxlen
print(longest_word('abc.txt'))

### number of each word

from collections import Counter
def wcount(fname):
    with open (fname) as f:
        return Counter(f.read().split())

print('total words in a file:',wcount("abc.txt"))



# 12.
# mean
def mean():
    sum=0
    count=0
    while True:
        s1=input("enter a number or \"Done\":")
        if s1=='done':
            if count==0:
                print("no numbers entered")
                return 0
            else:
                return sum/count
        else:
            try:
                sum+=int(s1)
                count+=1
            except ValueError:
                print("invalid entry")

print(mean())


# hm
def harmonic_mean():
    sum=0
    count=0
    while True:
        s1=input("enter a number or \"done\":")
        if s1=='done':
            if count==0:
                print("no numbers entered")
                return 0
            else:
                return count/sum
        else:
            try:
                sum+=1/float(s1)
                count+=1
            except ValueError:
                print("invalid entry")
            except ZeroDivisionError:
                print("cannot find harmonic mean if an input is zero")

print(harmonic_mean())

## 13. count number of elements that cannot be converted to float
def cfloat(li):
    er=0
    for ele in li:
        try:
            x=float(ele)
        except ValueError:
            er+=1
    return er

li=[10,20,10.3,'asd','reyw','wer']
print(cfloat(li))

## 14.
## first

import math
class Complex():
    def __init__(self,real,imag):
        self.re=real
        self.im=imag

    def __str__(self):
        if self.re==0 and self.im==0:
            return "0"
        if self.re==0 and self.im>0:
            return "i{}".format(self.im)
        if self.re==0 and self.im<0:
            return "-i{}".format(-self.im)
        if self.im>0:
            return "{}+i{}".format(self.re,self.im)
        return "{}+i{}".format(self.re,self.im)

    def length(self):
        return math.sqrt(self.re*self.re+self.im*self.im)

    def __add__(self,other):
        return Complex(self.re+other.re,self.im+other.im)

    def __sub__(self,other):
        return Complex(self.re-other.re,self.im-other.im)

    def __eq__(self,other):
        if isinstance(other,Complex):
            return self.re==other.re and self.im==other.im

    def __ne__(self,other):
        if isinstance(other,Complex):
            return self.re!=other.re or self.im!=other.im

if __name__=="__main__":
    a=Complex(3,4)
    b=Complex(3,-3)
    print(a)
    print(b)
    print(a.length())
    print(a+b)
    print(a-b)
    print(a==b,a!=b)
    
    
            


## multiplication
import math
class Complex():
    def __init__(self, real, imaginary):
        self.re = real
        self.im = imaginary
    def __str__(self):
        if self.re==0 and self.im==0:
            return "0"
        if self.re==0 and self.im>0:
            return "i ".format(self.im)
        if self.re==0 and self.im<0:
            return "-i{}".format(-self.im)
        if self.im<0:
            return "{}-i{}".format(self.re, -self.im)
        if self.im>0:
            return "{}+i{}".format(self.re, self.im)
        return str(self.re)
    def length(self):
        return math.sqrt(self.re*self.re+self.im*self.im)
    def arg(self):
        if self.re == 0 and self.im == 0:
            raise ValueError
        if self.re > 0:
            return math.atan(self.im/self.re)
        if self.re < 0 and self.im >= 0:
            return math.atan(self.im/self.re) + math.pi
        if self.re < 0 and self.im < 0:
            return math.atan(self.im/self.re) - math.pi
        if self.re == 0 and self.im > 0:
            return math.pi/2
        if self.re == 0 and self.im < 0:
            return -math.pi/2
    def conjugate(self):
        return Complex(self.re,-self.im)
    def __add__(self,other):
        return Complex(self.re+other.re, self.im+other.im)
    def __sub__(self,other):
        return Complex(self.re-other.re, self.im-other.im)
    def __mul__(self,other):
        return Complex(self.re*other.re-self.im*other.im, self.re*other.im+self.im*other.re)
    def __truediv__(self,other):
        frac = other.re**2+other.im**2
        return Complex((self.re*other.re+self.im*other.im)/frac, (self.im*other.re-self.re*other.im)/frac)
    def __eq__(self,other):
        if isinstance(other, Complex):
            return self.re==other.re and self.im==other.im
        if isinstance(other, float) or isinstance(other,int):
            return self.re==other and self.im == 0
        return NotImplemented
    def __ne__(self,other):
        if isinstance(other, Complex):
            return self.re!=other.re and self.im!=other.im
        if isinstance(other, float) or isinstance(other,int):
            return self.re!=other and self.im != 0
        return NotImplemented

if __name__ == "__main__":
    a = Complex(2,3)
    b = Complex(3,-5)
    print(a==b, a!=b)
    print(a==Complex(2,3), a!=Complex(2,3))
    a+=b
    print(a)
    print(a+b,a-b,a*b,a/b)
    a /= b
    print(a)








