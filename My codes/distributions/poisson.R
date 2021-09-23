## Fit a poisson distribution to the following data with respect to the 
## number of red blood corpuscles(x). Find expected value also.
x = c(0, 1, 2, 3, 4, 5, 6, 7, 8)
f = c(162, 193, 115, 83, 44, 24, 19, 8, 2)
x=0:8
f=c(162,193,115,83,44,24,19,8,2)
l=sum(f*x)/sum(f)
l

px=dpois(x,l)
ex=round(px*sum(f),0)
fr.dist=data.frame(x,f,px,ex)
fr.dist
