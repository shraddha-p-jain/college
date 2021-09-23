# install.packages("TSA")
library(TSA)
data(larain)

## larain is a data of annual rainfall in los angeles 1878-1992

plot(larain,ylab='Inches',xlab='Year',type='o')

# plotting the data y-actual data, x-lag 1 data
plot(y=larain,x=zlag(larain),ylab='Inches',
     xlab='Previous Year Inches')

## zlag(x,d=1) 
## Output is a vector x with lag d.
cov(larain[-1],zlag(larain)[-1])
cor(larain[-1],zlag(larain)[-1])
acf(larain)

data(color)
?color
plot(color,type='o')
# plot against lag 1
plot(y=color,x=zlag(color),ylab='Color Property',
     xlab='Previous Batch Color Property')
## there is a slight upward trend
acf(color)


data(hare)
plot(hare,ylab='Abundance',xlab='Year',type='o')
## We can see that there is no trend, but there is cyclic variations
plot(y=hare,x=zlag(hare),ylab='Abundance',
     xlab='Previous Year Abundance')


data(tempdub)
plot(tempdub,ylab='Temperature',type='o')
#sesonality
plot(y=tempdub,x=zlag(tempdub))
acf(tempdub)


data(oilfilters)
plot(oilfilters,type='o',ylab='Sales')
points(y=oilfilters,x=time(oilfilters),
       pch=as.vector(season(oilfilters)))


   US_V_Sales <- TSstudio::USVSales

## autocorrelation and autocovariance
cov(hare[-1],zlag(hare)[-1])
cor(hare[-1],zlag(hare)[-1])
acf(hare)

