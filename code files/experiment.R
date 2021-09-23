# Basic experimenting
# File - https://www.kaggle.com/russellyates88/suicide-rates-overview-1985-to-2016
df = read.csv("C://Users//Shraddha//Desktop//Data//master.csv")
head(df)

tail(df)
x<- (df$suicides_no/df$population)*100000
x=df$suicides.100k.pop

plot(x,"o", lty = 6, col = "deepskyblue")
legend(locator(1),legend = c('suicide rate'),pch = c(1),col='deepskyblue')