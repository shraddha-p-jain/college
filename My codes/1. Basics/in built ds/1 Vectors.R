# basic datatypes:
## integer
## numeric (corresponds to float)
## character (corresponds to string)
## factor

# inbuilt data structures

# Vectors:

## Creating
a = c(3,4,5)
b = seq(1,10,2)
c = scan()
3 3 4 5 3 4 2
2 4 2 4

## selecting, filtering
c[1]    # first element  ## indexing starts at 1
c[-1]   # all except first element
a[c(1,3,5)]  # 1,3,5th element
c[3:5]   # includes both 3,5

a[a>3]
a[a>3&a<5]
