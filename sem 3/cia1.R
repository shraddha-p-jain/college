data = read.csv("C:\\Users\\Shraddha\\Downloads\\client.csv")
head(data)
summary(data)
# There is a lot of difference between the 3rd quartile and maximum 
# in the columns: balance, duration, campaign. We will need to check 
# for ouliers in them.
names(data)
dim(data)
str(data)

# Preprocesing
data = data[,-1]
data$job = as.factor(data$job)
data$marital=as.factor(data$marital)
data$education = as.factor(data$education)
data$default = as.factor(data$default)
data$housing = as.factor(data$housing)
data$loan = as.factor(data$loan)
data$contact = as.factor(data$contact)
data$month=as.factor(data$month)
data$y = as.factor(data$y)
str(data)

attach(data)

# Tables and visualization:---------------------------------
# y
tbl = table(y)
tbl
prop.table(tbl)

# job
tbl = table(job)
tbl

tbl = table(y,job)
tbl
prop.table(tbl,margin = 2)
##  admin,management,retired,student,unemployed more 
## say yes

barplot(tbl,legend.text = TRUE, col = rainbow(5))
levels(job)

barplot(prop.table(tbl,margin = 2), col = rainbow(5))
levels(job)

## marital
tbl = table(y,marital)
tbl

prop.table(tbl,margin =1)
prop.table(tbl,margin = 2)
barplot(tbl, col = rainbow(5))
barplot(prop.table(tbl,margin = 2), col = rainbow(5))

## education
tbl = table(education)
tbl
tbl = table(y,education)
tbl

prop.table(tbl,margin =1)
prop.table(tbl,margin = 2)
barplot(tbl, col = rainbow(5))
barplot(prop.table(tbl,margin = 2), col = rainbow(5))

##
## default
tbl = table(default)
tbl
tbl = table(y,default)
tbl

prop.table(tbl,margin =1)
prop.table(tbl,margin = 2)
barplot(tbl, col = rainbow(5))
barplot(prop.table(tbl,margin = 2), col = rainbow(5))

##housing
tbl = table(housing)
tbl
tbl = table(y,housing)
tbl

prop.table(tbl,margin =1)
prop.table(tbl,margin = 2)
barplot(tbl, col = rainbow(5))
barplot(prop.table(tbl,margin = 2), col = rainbow(5))

## loan
tbl = table(loan)
tbl
tbl = table(y,loan)
tbl

prop.table(tbl,margin =1)
prop.table(tbl,margin = 2)
barplot(tbl, col = rainbow(5))
barplot(prop.table(tbl,margin = 2), col = rainbow(5))

## contact
tbl = table(contact)
tbl
tbl = table(y,contact)
tbl

prop.table(tbl,margin =1)
prop.table(tbl,margin = 2)    ## unknown form of contact less likely..
barplot(tbl, col = rainbow(5))
barplot(prop.table(tbl,margin = 2), col = rainbow(5))

## month
tbl = table(month)
tbl
tbl = table(y,month)
tbl

prop.table(tbl,margin =1)
prop.table(tbl,margin = 2)
barplot(tbl, col = rainbow(5))
barplot(prop.table(tbl,margin = 2), col = rainbow(5))
## target people in march, spet,oct, dec

####
hist(age)

tbl = table(y,age)
barplot(tbl, col = rainbow(5))
barplot(prop.table(tbl,margin = 2), col = rainbow(5))

# binning age:
agerange = ifelse(age<25,'young',ifelse(age<60,'middle','old'))
tbl = table(agerange)
tbl
tbl = table(y,agerange)
tbl

prop.table(tbl,margin =1)
prop.table(tbl,margin = 2)
barplot(tbl, col = rainbow(5))
barplot(prop.table(tbl,margin = 2), col = rainbow(5))

### balance
hist(balance)
boxplot(balance)
data[which(data$balance>30000),]

## wanted t0 check whether -ve balance indicated default, but 
# not the case
neg_bal =data[which(data$balance<0),]
neg_bal
table(neg_bal$default)

boxplot(neg_bal$balance)
neg_bal[which.min(neg_bal$balance),]
neg_bal[which(neg_bal$balance<(-1000)),]

hist(neg_bal$balance)

## remove the outliers:
neg_bal = neg_bal[which(neg_bal$balance>(-1000)),]
hist(neg_bal$balance)

### binning:




### day
hist(day)
tbl = table(y,day)
tbl
barplot(tbl, col = rainbow(5))
barplot(prop.table(tbl,margin = 2), col = rainbow(5))
### on 1,10 and 24-25, least number of people are contacted, 
### but they seem more likely to say yes

## duration
hist(duration)
boxplot(duration)

dur = data[which(data$duration<1500),]
hist(dur$duration)


## campaign
hist(campaign)
boxplot(campaign)


library(car)
vif(lm(duration~campaign+day,data = data))


## train-test split
smp_size<-floor(0.75*nrow(data))
set.seed(1028)
trainingdata <- sample(seq_len(nrow(data)),size=smp_size)
training<-data[trainingdata,]
testing<-data[-trainingdata,]

tab1<-table(training$y)
prop.table(tab1)

tab2<-table(testing$y)
prop.table(tab2)


### basic logistic model
logistic_model = glm(y~.,data = training,family = 'binomial')
summary(logistic_model)

names(logistic_model)

## using step function, but it is using all the dummy variables of month
step_model = step(glm(y~.,data = training,family = 'binomial'))
summary(step_model)  
### do it manually





## Overall model significance
with(logistic_model,pchisq(null.deviance-deviance,df.null-df.residual,lower.tail = F))

## Model is overall significant

anova(logistic_model,test = 'Chisq')


## Prediction probabilities
p = predict(logistic_model,type = 'response')
head(p)

p_test = predict(logistic_model,type = 'response',newdata = testing)
head(p_test)

## Classification table
pred <- ifelse(p<0.5,0,1)
pred_test <- ifelse(p_test<0.5,0,1)

tab_train <- table(pred,actual = training$y)
tab_train

sumtab_train<- addmargins(tab_train,FUN=sum)
sumtab_train

tab_test <-table(pred_test,actual = testing$y)
tab_test
sumtab_test<- addmargins(tab_test,FUN=sum)
sumtab_test

TAP <- sum(tab_test[,2])   #Total actual positives
TAN <- sum(tab_test[,1])   # Total actual negatives

TP <- sumtab_test[2,2]
TN <- sumtab_test[1,1]
FP <- sumtab_test[2,1]
FN <- sumtab_test[1,2]

TPR = TP/TAP    # Sensitivity or recall ## ability to correctly classify 
# positives
TPR

FPR = FP/TAN    
FPR

TNR = TN/TAN   # Specificity
TNR


accuracy = (TP+TN)/(TAN+TAP)
accuracy
miss_classification_error = 1-accuracy
miss_classification_error

precision = TP/(TP+FP)
precision  # conditional probability of being positive when predicted positive

fscore = 
  
  