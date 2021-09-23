##Plots

#line chart
## to find trend
x=seq(0,2, by = 0.2)
y=x
y2 = y^2
y3 = y^3
plot(x,y)
## pch - plotting symbol - search pch in r 
plot(x,y, pch=2)#triangle
## lty - line type
plot(x,y, pch=2, lty = 2, "l") #only line
points(2, 0.5) #adding a random pint
plot(x,y, pch=2, lty = 2, "o") #both line and point
plot(x,y, pch=2, lty = 2, "p") # only points

# changing lables
plot(x,y, xlab = "x",ylab = "y", main = "Line chart")

# change limiit
plot(x,y, xlab = "x",ylab = "y", main = "Line chart", xlim = c(0,3), ylim = c(0,4))

## charachter expansion - cex=2


plot(x,y,"o", pch = 1,lyt=1, col= "Red")
##to add to this
lines(x,y2, "o", pch =2, col = "Blue")
lines(x,y3, "o", pch =4, col = "Black")

#legend
legend(locator(1), legend = c("line", "quadratic","cubic"), pch = c(1,2,3), lwd =2, cex = 0.8)
#lwd = line width
# locator - you get the legend where you click on the graph


# bar plot
rain = c(3,5,7,5,3,2,6,8,5,6,8,9)
barplot(rain)

barplot(rain, ylim = c(0, 10))
#base line
abline(h=0)
abline(h=5)
#naming x axis
barplot(rain,names=month.abb ,ylim = c(0, 10))
abline(h=0)

#lablelling
brplt = barplot(rain,names=month.abb ,ylim = c(0, 10))
text(brplt, y=0,rain,pos=2, col="blue")
brplt
# on top??
# cover in a box
box()

year = c(1995:2000)
sales = c(15,25,27,28,26,26.6)
an.sales = data.frame(year,sales)
an.sales
barplot(an.sales$sales)
brplt1 = barplot(an.sales$sales,ylim = c(0,30), names = c(1995:2000))
brplt1

# on top - position = 3
text(brplt1,an.sales$sales,sales,pos=3, col = "Black", )
# horizontal
barplot(an.sales$sales, horiz = T)

count = c(9,25,15,2,14,25,24,47)
speed = c(2,3,5,6,14,24,29,34)
fw = data.frame(count, speed)
barplot(fw$count)
#stack - sub divided
barplot(as.matrix(fw))
#side - two plots
barplot(as.matrix(fw),beside = T)

clmn = colMeans(fw)
barplot(clmn)

barplot(fw$count)
legend(x='topright',legend = c(1:8) )

title(xlab =expression( 'bird'['habitat']))
title(xlab =expression( 'bird'['habitat']))

#class 2
require(grDevices)
require(stats)

## dpois, rpois, qpois, ppois
#set.seed(100)
ni = rpois(100,5)
mean(ni)
t = table(ni)
t

r = barplot(t,col = rainbow(15))
lines(r,t,col='black',lwd=2)
# barplot - highlevel function
#lines - low level function - add to a pre-existing plot
lines(r,t,type='h',col='Black', lwd=2)
abline(h=0)
#gaps
barplot(t,space=1.5,axisnames = F)



View(VADeaths)
barplot(VADeaths,plot=T,beside =T, legend = colnames(VADeaths))

barplot(t(VADeaths),plot = T, beside = T)
barplot(t(VADeaths)[,5:1],plot = T, beside = T)


## piechart
fcolor = c(3,1,4,6,8,3,2)
pie(fcolor, main = 'Pie')
pie(fcolor, main = 'Pie',init.ang=180)


lbls = c("Red","Orange","Green","Yellow","Blue","Purple","Others")
lbls = paste(lbls,fcolor)
pie(fcolor,labels = lbls)


## Scatterplot
View(iris)
head(iris)
class(iris)
summary(iris)
#correlation
cor(iris$Sepal.Length,iris$Petal.Length)
plot(iris$Sepal.Length,iris$Petal.Length)

cor(iris$Sepal.Length, iris$Sepal.Width)
plot(iris$Sepal.Length,iris$Sepal.Width)


par(mfrow = c(2,2))
plot(iris$Sepal.Length,iris$Sepal.Width)
plot(iris$Sepal.Length,iris$Petal.Length)
plot(iris$Sepal.Length,iris$Petal.Length)
plot(iris$Sepal.Width,iris$Petal.Width)


pairs(iris)

pairs(iris[,c(1:4)])
#correlation matrix
cor(iris[,c(1:4)])

plot(iris$Sepal.Length,iris$Petal.Length, type = 'l')



library(RcmdrMisc)
