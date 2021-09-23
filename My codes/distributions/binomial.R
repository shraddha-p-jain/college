# Fit a binomial distribution for the following data.
x = c(0, 1, 2, 3, 4, 5, 6, 7)
f = c(0, 4, 13, 28, 42, 20, 6, 2)

?Binomial
n = max(x)
N = sum(f)
smean = sum(x*f)/N
sprob = smean/n

px = dbinom(x,n,sprob)
px
px = round(px,6)
ef = round(px*N,0)

dist = data.frame(x,f,ef)
dist

plot(x,f,"o")
points(x,ef,'o',pch=2)

