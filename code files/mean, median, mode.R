x = c(18,18,19,20,18,19,19,20,20,20,18,19,26,23,24,30,26,27)
mean(x)
median(x)
median(x[which(x<25)])
# or
median(x[x<25])
#or
y =x[x<25]
median(y)

## Mode
# Freq
table(x)
## But we do have  repeating modes
which.max(table(x))
# adding elements
x=c(x,19,20,25,18,20)
x
mean(x)

## Grouped
x = runif(100,100,1000)
length(x)
range(x)
#range
rng =(max(x)-min(x))
#making classes
num = 9
# class width
w = 900/num
w

bins = seq(100,900,length.out = 9)
bins
temp = cut(x,bins, right = F)
temp
table(temp)

#from mid-val
bins = seq(150,950,length.out = 9)
bins
f=c(0,0,0,0,0,0,0,0,0,0)
for (i in length(bins)-1){
  f[i]=length(x[x>=bins[i] & x<bins[i+1]])
}
f

