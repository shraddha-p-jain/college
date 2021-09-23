# Fitting distributions:

# Out of 20 packages to be dispached by a mail-room clerk eight are to be by 
# air mail and the rest by surface mail. The package got mixed thoroughly. 
# Five of the packages are selected randomly. The distribution of packages
# marked for air mail into the chosen five packages, observed over period
# of 100 days is given below. Fit hyper geometric distribution to the given data.

# x = (0, 1, 2, 3, 4, 5)
# f = (7, 22, 45, 20, 5, 1)

x = c(0:5)
f = c(7,22,45,20,5,1)

m = 8
n = 12
k=5

px=dhyper(x,m,n,k)
px                ## probabilities
px=round(px,6)
px
ef=round(100*px,0) # expected frequencies - fitted distribution

dist = data.frame(x,f,ef)
dist


