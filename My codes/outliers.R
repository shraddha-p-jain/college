# Outliers

data =c(sample(c(1:20),40,T),50,68)
summary(data)
boxplot(data)
length(data)

# manually
q1 = quantile(data,c(0.25))
q3 = quantile(data,c(0.75))
iqr = IQR(data)

up.fringe = q3+1.5*iqr
low.fringe = q1 - 1.5*iqr

#finding
outl = data[data<low.fringe | data> up.fringe]

#indexes
which(data == c(outl))

#removing
data = data[data>low.fringe & data < up.fringe]
# or
data = data[-which(data == c(outl))]
# or 
data = data[which(data != c(outl))]



# using packages
boxplot.stats(data)

x <- data[data != c(boxplot.stats(data))$out]

## https://statsandr.com/blog/outliers-detection-in-r/

## to learn more
