# Descriptive statistics


#ungrouped data
x = iris$Petal.Length

# mean
mean(x)

# weighted mean
weighted.mean(x,w = x) # weights equal to their value

# geometric mean
exp(mean(log(x)))

# harmonic mean
1/mean(1/x)

# trimmed mean
mean(x, trim = .05)

# median
median(x)

## adding condition: of only those where x<5
mean(x[x<5])
median(x[x<5])

# mode
a = table(x)
which.max(table(x)) ## gives the mode element and its position. 
                    ## in case of multimodal dist, gives the smallest one

which(a==max(a))    ## gives all the modal elements and their position

as.numeric(names(which(a==max(a)))) # a vector of modal values

# quantiles
quantile(x, probs = c(0,.25,.50,.75,1)) # fives min, 1st, 2nd, 3rd quartiles, max

# percentiles and stuff
quantile(x,probs = .35) # 35 percentile

# five num summary
fivenum(x)
# five num summary+mean
summary(x)


# discrete
a=c(0, 1, 2, 3, 4, 7)
f=c(3, 7, 14, 8, 2, 1)

# convert to ungrouped, and continue
y=rep(a,f)
y


# continuous

# grouping
bins = seq(1,7,by = 1)
class_x = cut(x,breaks = bins,right = FALSE)
grouped_x = table(class_x)
grouped_x

# midpoints:
lower_limit = seq(1,6, by =1)
upper_limit = seq(2,7,by=1)
midpt = (lower_limit+upper_limit)/2

# mean
sum(grouped_x*midpt)/sum(grouped_x)

# median : l+h(N/2-c)/f
## cumulative frequency
cf = cumsum(grouped_x)
N = sum(grouped_x)
l = lower_limit[min(which(cf>=N/2))]
f = as.numeric(grouped_x[min(which(cf>=N/2))])
c = as.numeric(cf[max(which(cf<=N/2))])
h = 1 #class height

l+h*(N/2-c)/f

# Mode : l+h(f1-f0)/(2f1-f0-f2)
l = lower_limit[which(grouped_x==max(grouped_x))]
l ## cannot find mode as the first class is modal class

bins = seq(1,7,by = .5)
class_x = cut(x,breaks = bins,right = FALSE)
grouped_x = table(class_x)
grouped_x

# midpoints:
lower_limit = seq(1,6.5, by =.5)
upper_limit = seq(1.5,7,by=.5)
midpt = (lower_limit+upper_limit)/2

l = lower_limit[which(grouped_x==max(grouped_x))]
h=0.5
f1 = grouped_x[which(grouped_x==max(grouped_x))]
f0 = grouped_x[which(grouped_x==max(grouped_x))-1]
f2 = grouped_x[which(grouped_x==max(grouped_x))+1]

as.numeric(l+h*(f1-f0)/(2*f1-f0-f2))

# Quantiles: 
# lower: l+h*(N/4-cf)/f
## cumulative frequency

cf = cumsum(grouped_x)
N = sum(grouped_x)
l = lower_limit[min(which(cf>=N/4))]
f = as.numeric(grouped_x[min(which(cf>=N/4))])
min(which(cf>=N/4)) 
c = (cf[min(which(cf>=N/4))-1])
min(which(cf>=N/4))
c=0 # since the quartile class is the first class
h = 1 #class height

l+h*(N/4-c)/f

# Upper:
cf = cumsum(grouped_x)
N = sum(grouped_x)
l = lower_limit[min(which(cf>=3*N/4))]
f = as.numeric(grouped_x[min(which(cf>=3*N/4))])
c = (cf[min(which(cf>=3*N/4))-1])

h = 1 #class height
l+h*(3*N/4-c)/f


# Percentiles - sir 10.1
# pth percentile: 
p = 67
cf = cumsum(grouped_x)
N = sum(grouped_x)
l = lower_limit[min(which(cf>=p*N/100))]
f = as.numeric(grouped_x[min(which(cf>=p*N/100))])
c = as.numeric(cf[min(which(cf>=p*N/100))-1])

h = 1 #class height
l+h*(3*N/4-c)/f
