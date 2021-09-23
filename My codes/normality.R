# normality

normality=read.csv(file.choose())
summary(normality)
str(normality)

library('moments')
skewness(normality)
skewness(normality,na.rm = TRUE)

# boxplots and histograms

# summary
summary(normality)

## 2 might be return  as 20
which(normality==c(20))
View(normality)
