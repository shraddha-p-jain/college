data=read.csv("C:\\Users\\ABC\\Downloads\\adult.csv",header= FALSE, strip.white = TRUE)

colnames(data)=c('age','workclass','fnlwgt','education','education.num','marital.status','occupation','relationship','race','sex','capital.gain','capital.loss','hour.per.week','native.country','income')


str(data)
#View(data)
data$education.num <- NULL
data_test$income=as.factor(data_test$income)
levels(data_test$income)


t2=table(data$income)
prop.table(t2)


summary(data)
#data[data == " ?" ]<- NA
data$workclass= as.factor(data$workclass)
data$education = as.factor(data$education)
data$marital.status = as.factor(data$marital.status)
data$occupation = as.factor(data$occupation)
data$relationship = as.factor(data$relationship)
data$race = as.factor(data$race)
data$sex = as.factor(data$sex)
data$native.country = as.factor(data$native.country)
data$income = as.factor(data$income)


summary(data)

table(data$income)

prop.table(table(data$income))
table(data_test$income)
prop.table(table(data_test$income))

pie(table(data$income), main = 'data')

pie(table(data_test$income),main = 'test data')

levels(data_test$income)

levels(data$workclass)
levels(data$workclass)[1]<-'un_wrkcl'
levels(data$education)
levels(data$marital.status)
levels(data$occupation)
levels(data$occupation)[1]<-'un_occ'
levels(data$relationship)
levels(data$race)
levels(data$native.country)
levels(data$native.country)[1]<-'un_nc'
levels(data$income)





sz <- round(.8 * dim(data)[1])  # training_set set size
training_set <- data[1:sz,]
testing_set <- data[-(1:sz),]

basic_model<-glm(income~.-workclass-education-marital.status-occupation-relationship-race-native.country, data=training_set, family='binomial')
summary(basic_model)
step(basic_model, data=data)


with(baisc_model,pchisq(null.deviance-deviance,df.null-df.residual,lower.tail = F))

## Model is overall significant

anova(basic_model,test = 'Chisq')
















#install.packages('mltools')
library(mltools)
library(data.table)
workcl <- one_hot(as.data.table(data$workclass))
workcl



educationed <- one_hot(as.data.table(data$education))
marital.statused <- one_hot(as.data.table(data$marital.status))
occupationed <- one_hot(as.data.table(data$occupation))
relationshiped<- one_hot(as.data.table(data$relationship))
raceed <- one_hot(as.data.table(data$race))
native.countryed <- one_hot(as.data.table(data$native.country))


data1=cbind(data,educationed,marital.statused,occupationed,relationshiped,raceed,native.countryed)

basic_model<-glm(income~.-workclass-education-marital.status-occupation-relationship-race-native.country-V1_Some-college-V1_Widowed-`V1_Transport-moving`-V1_Wife-V1_White-V1_Yugoslavia, data=data1, family='binomial')


summary(basic_model)
step(basic_model, data=data)


levels(data$occupation)[1] <- 'Unknown'
data$occupation <- gsub('Adm-clerical', 'White-Collar', data$occupation)
data$occupation <- gsub('Craft-repair', 'Blue-Collar', data$occupation)
data$occupation <- gsub('Exec-managerial', 'White-Collar', data$occupation)
data$occupation <- gsub('Farming-fishing', 'Blue-Collar', data$occupation)
data$occupation <- gsub('Handlers-cleaners', 'Blue-Collar', data$occupation)
data$occupation <- gsub('Machine-op-inspct', 'Blue-Collar', data$occupation)
data$occupation <- gsub('Other-service', 'Service', data$occupation)
data$occupation <- gsub('Priv-house-serv', 'Service', data$occupation)
data$occupation <- gsub('Prof-specialty', 'Professional', data$occupation)
data$occupation <- gsub('Protective-serv', 'Service', data$occupation)
data$occupation <- gsub('Tech-support', 'Service', data$occupation)
data$occupation <- gsub('Transport-moving', 'Blue-Collar', data$occupation)
data$occupation <- gsub('Unknown', 'Other/Unknown', data$occupation)
data$occupation <- gsub('Armed-Forces', 'Other/Unknown', data$occupation)
data$occupation <- as.factor(data$occupation)
summary(data$occupation)


table(data$occupation)
prop.table(table(data$occupation))
pie(table(data$occupation))

t1=table(data$income,data$occupation)
t1
prop.table((t1), margin=2)
barplot((table(data$income,data$workclass)),las=2, col= rainbow(11))
barplot((prop.table(t1,margin=2)),las=2, col= rainbow(4))
legend("bottomleft", c("<50k",">50k"), fill=rainbow(4))

#data$occupation <- NULL

##workclass
table(data$workclass)

t1=table(data$income,data$workclass )
t1
sumtab=addmargins(t1, FUN=sum, margin=1)
sumtab

prop.table(t1,margin = 2)
sumtab=addmargins(prop.table(t1,margin = 2), FUN=sum, margin=1)
table(data$native.country)

data=data5

par(mfrow=c(1,1))

table(data$workclass)
prop.table(table(data$workclass))
pie(table(data$workclass))

t1=table(data$income,data$workclass)
t1
prop.table((t1), margin=2)
barplot((table(data$income,data$workclass)),las=2, col= rainbow(11))
barplot((prop.table(t1,margin=2)),las=2, col= rainbow(4))
legend("bottomleft", c("<50k",">50k"), fill=rainbow(4))

# combine into Government job
levels(data$workclass)[1] <- "unknown/other"
levels(data$workclass)

levels(data$workclass)[4]<-"unknown/other"
levels(data$workclass)[8]<-"unknown/other"
levels(data$workclass)[3]<-"state/local gov"
levels(data$workclass)[6]<-"state/local gov"

t1=table(data$income,data$workclass)
prop.table(t1, margin=2)
sumtab=addmargins(t1, FUN=sum, margin=1)
sumtab
barplot((prop.table(t1,margin=2)),las=2, col= rainbow(4))


y=glm(income~workclass, data=data, family = "binomial")
summary(y)


#data$workfed<-ifelse(data$workclass =="Federal-gov",1,0)

###age
library(ggplot2)
ggplot()+geom_bar(data=data,
                  aes(x=factor(data$hour.per.week),fill=factor(data$income)),
                  position= "fill")+ scale_x_discrete("
                    hour")+scale_y_continuous("Percent")+
  guides(fill=guide_legend(title ="data"))+scale_fill_manual(values=c("blue","red"))

##gender
t1=table(data$income,data$occupation)
prop.table((t1), margin=2)
barplot(t1,las=2, col= rainbow(11))
barplot((prop.table(t1,margin=2)),las=2, col= rainbow(4))
legend("bottomleft", c("<50k",">50k"), fill=rainbow(4))



##education
table(data$education)
prop.table(table(data$education))
pie(table(data$education))

t1=table(data$income,data$education)
t1
prop.table((t1), margin=2)
barplot(t1,las=2, col= rainbow(11))
barplot((prop.table(t1,margin=2)),las=2, col= rainbow(4))
legend("bottomleft", c("<50k",">50k"), fill=rainbow(4))

levels(data$education)[1:7]<-'school'
levels(data$education)[2:3]<-'assoc-acdm/voc'
levels(data$education)[7]<-'school'
levels(data$education)[5]<-'school'
levels(data$education)[4]<-'doctorate/prof-chool'
levels(data$education)[6]<-'doctorate/prof-chool'

t1=table(data$income,data$education)
t1
prop.table((t1), margin=2)
barplot(t1,las=2, col= rainbow(11))
barplot((prop.table(t1,margin=2)),las=2, col= rainbow(4))
legend("bottomleft", c("<50k",">50k"), fill=rainbow(4))

y=glm(income~education, data=data, family = "binomial")
summary(y)

##marital status
table(data$marital.status)
prop.table(table(data$marital.status))
pie(table(data$marital.status))

t1=table(data$income,data$marital.status)
t1
prop.table((t1), margin=2)
barplot(t1,las=2, col= rainbow(11))
barplot((prop.table(t1,margin=2)),las=2, col= rainbow(4))
legend("bottomleft", c("<50k",">50k"), fill=rainbow(4))

levels(data$marital.status)
levels(data$marital.status)[2:3]<-'currently living with spouse'
levels(data$marital.status)[5:6]<-'widow/seprated'
levels(data$marital.status)[1]<-'widow/seprated'

t1=table(data$income,data$marital.status)
t1
prop.table((t1), margin=2)
barplot(t1,las=2, col= rainbow(11))
barplot((prop.table(t1,margin=2)),las=2, col= rainbow(4))
legend("bottomleft", c("<50k",">50k"), fill=rainbow(4))

y=glm(income~data$livingtogether.+data$nevermarried+data$sep, data=data, family = "binomial")
summary(y)

data$livingtogether.<-ifelse(data$marital.status =="currently living with spouse",1,0)
data$nevermarried<-ifelse(data$marital.status =="Never-married",1,0)
data$sep<-ifelse(data$marital.status =="widow/seprated",1,0)

#relationship
table(data$relationship)
prop.table(table(data$relationship))
pie(table(data$relationship))

t1=table(data$income,data$relationship)
t1
prop.table((t1), margin=2)
barplot(t1,las=2, col= rainbow(11))
barplot((prop.table(t1,margin=2)),las=2, col= rainbow(4))
legend("bottomleft", c("<50k",">50k"), fill=rainbow(4))

levels(data$relationship)
levels(data$relationship)[2:5]<-'other'
levels(data$relationship)[1]<-'husband/wife'
levels(data$relationship)[3]<-'husband/wife'

t1=table(data$income,data$relationship)
t1
prop.table((t1), margin=2)
barplot(t1,las=2, col= rainbow(11))
barplot((prop.table(t1,margin=2)),las=2, col= rainbow(4))
legend("bottomleft", c("<50k",">50k"), fill=rainbow(4))


y=glm(income~relationship, data=data, family='binomial')
summary(y)

##race
table(data$race)
prop.table(table(data$race))
pie(table(data$race))

t1=table(data$income,data$race)
t1
prop.table((t1), margin=2)
barplot(t1,las=2, col= rainbow(11))
barplot((prop.table(t1,margin=2)),las=2, col= rainbow(4))
legend("bottomleft", c("<50k",">50k"), fill=rainbow(4))

y=glm(income~white+black+othere+asian, data=data, family='binomial')
summary(y)


levels(data$race)

data$white<-ifelse(data$race =="White",1,0)
data$black<-ifelse(data$race =="Black",1,0)
data$othere<-ifelse(data$race =="Other",1,0)
data$asian<-ifelse(data$race =="Asian-Pac-Islander",1,0)
data$am.ind.esk<-ifelse(data$race =="Amer-Indian-Eskimo",1,0)


#################3native.country
table(data$native.country)
prop.table(table(data$native.country))
pie(table(data$native.country))

t1=table(data$income,data$native.country)
t1
prop.table((t1), margin=2)
barplot(t1,las=2, col= rainbow(11))
barplot((prop.table(t1,margin=2)),las=2, col= rainbow(4))
legend("bottomleft", c("<50k",">50k"), fill=rainbow(4))

levels(data$native.country)[1:39]<-"other"

levels(data$native.country)[3:4]<-"other"














vif_ms <- glm(livingtogether.~.-marital.status-nevermarried , data = data, family = binomial)
summary(vif_ms)
vif(vif_ms)
colnames(data)
 attributes(alias(vif_ms)$Complete)$dimnames[[1]]


 table(data1$occupation)
 
levels(data$occupation) 
 


data_test$native.country <- NULL
data$relationship<-NULL
data$V1_.<-NULL
data$V1_Adm.clerical<-NULL
data$

sz <- round(.8 * dim(data)[1])  # training_set set size
training_set <- data[1:sz,]
testing_set <- data[-(1:sz),]




S
data$occupation <- NULL
data$relationship <- NULL
data$workclass <- NULL


prob <- predict(m1, testing_set, type = 'response')
pred <- rep('<=50K', length(prob))
pred[prob>=.5] <- '>50K'
# confusion matrix 
tb <- table(pred, testing_set$income)
tb
#summary(m1)

m_full <- m1  # full model is the model just fitted
m_null <- glm(income ~ 1, data = training_set, family = binomial('logit'))

# backward selection
step(m_full, trace = F, scope = list(lower=formula(m_null), upper=formula(m_full)),
     direction = 'backward')
y<-glm(formula = income ~ age  + fnlwgt + education + 
      marital.status + occupation + relationship + race + sex + 
      capital.gain + capital.loss + hour.per.week + native.country, 
    family = binomial("logit"), data = training_set)
summary(y)

plot(data$age,data$income)




data$sz<-NULL



str(data)



logistic_model = glm(income~., data = training_set,family = 'binomial')
str(training_set)

str(data)

summary(logistic_model)
library(car)
vif(logistic_model)
names(logistic_model)


logistic_model1 = glm(income~., data = data,family = 'binomial')
summary(logistic_model1)

## using step function, but it is using all the dummy variables of month
#step_model = step(glm(income~.,data = training,family = 'binomial'))
#summary(step_model)  

### have to remove it manually





## Overall model significance
with(logistic_model,pchisq(null.deviance-deviance,df.null-df.residual,lower.tail = F))

## Model is overall significant

anova(logistic_model,test = 'Chisq')


## Prediction probabilities
p = predict(logistic_model,type = 'response')
head(p)

p_test = predict(logistic_model,type = 'response',newdata =  testing_set)
head(p_test)

## Classification table
pred <- ifelse(p<0.5,0,1)
pred_test <- ifelse(p_test<0.5,0,1)

tab_train <- table(pred,actual = training_set$income)
tab_train

sumtab_train<- addmargins(tab_train,FUN=sum)
sumtab_train

tab_test <-table(pred_test,actual = testing_set$income)
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


fscore = 2*precision*TPR/(precision+TPR)
fscore   
## ROC Cureve
#install.packages('ROCR')
library(ROCR)
ROCRpred <- prediction(p_test,testing_set$income)
ROCRperf = performance(ROCRpred,'tpr','fpr')
ROCRperf
plot(ROCRperf,colorize = T,main = "ROC Curve",ylab = "Sensitivity
    ",xlab = 'FPR')
abline(a=0,b=1)

auc=performance(ROCRpred,measure = "auc")
auc@y.values[[1]]

###########
##oversampling
install.packages('ROSE')
library(ROSE)

over = ovun.sample(income~.,data = data,method = 'over',N = 50000,seed = 1029)
table(over$data$income)
summary(over)

#data=over





install.packages('mltools')
library(mltools)
library(data.table)
occupation1 <- one_hot(as.data.table(data$occupation))
data
head(occupation)


##cart
data$age.z=(data$age-mean(data$age))/sd(data$age)
barplot(data$age.z)
data$fnlwgt.z=(data$fnlwgt-mean(data$fnlwgt))/sd(data$fnlwgt)
data$capital.gain.z=(data$capital.gain-mean(data$capital.gain))/sd(data$capital.gain)
data$capital.loss.z=(data$capital.loss-mean(data$capital.loss))/sd(data$capital.loss)
plot(data$capital.loss.z)

smp_size<-floor(0.75*nrow(data))
smp_size
set.seed(1028)
nrow(data)
data_over=over$data

#str(over)
#training_data <- sample(seq_len(nrow(data_over)),size=smp_size)
#training<-data_over[training_data,]
#testing<-data_over[-training_data,]

str(over)
training_data <- sample(seq_len(nrow(data)),size=smp_size)
training<-data[training_data,]
testing<-data[-training_data,]


library(rpart)

cartfit=rpart(income~.-age-fnlwgt-capital.gain-capital.loss, data=training, method="class")
cartfit

library(rpart.plot)
rpart.plot(cartfit, main ="Classification Tree")

pred = predict(cartfit, type="class")
table(pred)
prop.table(table(pred))

pred_test = predict(cartfit, type="class",newdata = testing)
table(pred_test)


table1<-table(predicted = pred, actual =training$income )
table1
sumtable<-addmargins(table1,FUN=sum)
sumtable

p<-predict(cartfit,data)
p
prediction<-ifelse(p>0.5, 1,0)
prediction
head(prediction)

tab_test <- table(predicted = pred_test,actual = testing$income)
tab_test

TAP <- sum(tab_test[,2])   #Total actual positives
TAN <- sum(tab_test[,1])   # Total actual negatives

TP <- tab_test[2,2]
TN <- tab_test[1,1]
FP <- tab_test[2,1]
FN <- tab_test[1,2]
TPR = TP/TAP    # Sensitivity or recall ## ability to correctly classify 
# positives
TPR

FPR = FP/TAN    
FPR

TNR = TN/TAN   # Specificity
TNR


## Large diff between sensitivity and specificity is usually because class imbalance

accuracy = (TP+TN)/(TAN+TAP)
accuracy
miss_classification_error = 1-accuracy
miss_classification_error

precision = TP/(TP+FP)
precision  # conditional probability of being positive when predicted positive

fscore = 2*precision*TPR/(precision+TPR)
fscore  

library(C50)
tree_mod <- C5.0(x = training[-14], y = training$income)
tree_mod
summa(tree_mod)
summary(tree_mod)
colnames(training)

preditcted = predict.C5.0(tree_mod,newdata = testing,type='class')
tab_test = table(preditcted,actual = testing$income)
tab_test
TAP <- sum(tab_test[,2])   #Total actual positives
TAN <- sum(tab_test[,1])   # Total actual negatives

TP <- tab_test[2,2]
TN <- tab_test[1,1]
FP <- tab_test[2,1]
FN <- tab_test[1,2]

TPR = TP/TAP    # Sensitivity or recall ## ability to correctly classify 
# positives
TPR

FPR = FP/TAN    
FPR

TNR = TN/TAN   # Specificity
TNR


## Large diff between sensitivity and specificity is usually because class imbalance

accuracy = (TP+TN)/(TAN+TAP)
accuracy
miss_classification_error = 1-accuracy
miss_classification_error

precision = TP/(TP+FP)
precision  # conditional probability of being positive when predicted positive

fscore = 2*precision*TPR/(precision+TPR)
fscore  


pruned_tree <- C5.0(x=training[,-14],y=training$income,control = C5.0Control(CF = 0.001))
summary(pruned_tree)
plot(pruned_tree)


#remove outliers

boxplot(data$age.z)


##
library(randomForest)
library(tree)
treemod= tree(data$income~.-age-fnlwgt-capital.gain-capital.loss, data=data)
summary(treemod)

plot (treemod)
 text(treemod,pretty=0)
  p1<-predict(treemod,data)
 prediction1<-ifelse(p1>0.5, 1,0) 

 Ranfor= randomForest(training$income~.-age-fnlwgt-capital.gain-capital.loss-native.country, data=training)
 print(Ranfor) 
 importance(Ranfor)
 p1<-predict(Ranfor,testing)

 tab_test = table(p1,actual = testing$income)
 tab_test
 TAP <- sum(tab_test[,2])   #Total actual positives
 TAN <- sum(tab_test[,1])   # Total actual negatives
 
 TP <- tab_test[2,2]
 TN <- tab_test[1,1]
 FP <- tab_test[2,1]
 FN <- tab_test[1,2]
 
 TPR = TP/TAP    # Sensitivity or recall ## ability to correctly classify 
 # positives
 TPR
 
 FPR = FP/TAN    
 FPR
 
 TNR = TN/TAN   # Specificity
 TNR
 
 
 ## Large diff between sensitivity and specificity is usually because class imbalance
 
 accuracy = (TP+TN)/(TAN+TAP)
 accuracy
 miss_classification_error = 1-accuracy
 miss_classification_error
 
 precision = TP/(TP+FP)
 precision  # conditional probability of being positive when predicted positive
 
 fscore = 2*precision*TPR/(precision+TPR)
 fscore  
 
 
 
 
 
 
 
 
 
 
 
 
 
 str(data)

          
 boxplot(data$age)
 boxplot.stats(data$age)
 
 which(data$age>78)
 
 #####
 (boxplot.stats(data$fnlwgt))
 
 boxplot(data$capital.gain)
boxplot.stats(data$capital.gain)   

boxplot.stats(data$capital.loss)
boxplot(data$capital.loss)
data$capital.gain[which(data$capital.gain>80000)]
boxplot(data$hour.per.week)
boxplot(data$age)


data5 <- data[data$capital.gain<80000,]


# normalise
age.z = (data$age - mean(data$age))/sd(data$age)
which(age.z>3)
which(age.z<(-3))

gain.z = (data$capital.gain - mean(data$capital.gain))/sd(data$capital.gain)
which(gain.z>3)
which(gain.z<(-3))
plot(as.numeric(data$income),gain.z)

which(gain.z>3 | gain.z<(-3))


data.nout <- data[(gain.z<3&gain.z>(-3)),]

plot(data$capital.gain,as.numeric(data$income))
