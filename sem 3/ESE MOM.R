library(cluster)

install.packages('xlsx')
library(xlsx)
data.2 = read.xlsx("C:\\Users\\ABC\\Downloads\\ESE2_002.xlsx",sheetIndex = 1)

dim(data.2)
str(data.2)

# no nulls   lapply(data.2,function(x) { length(which(is.na(x)))})

data.2$asa_status_002 = as.factor(data.2$asa_status_002)
data.2$gender_002 = as.factor(data.2$gender_002)
data.2$dow_002 = as.factor(data.2$dow_002)
data.2$month_002 = as.factor(data.2$month_002)
data.2$moonphase_002 = as.factor(data.2$moonphase_002)
data.2$mort30_002 = as.factor(data.2$mort30_002)
data.2$race_002 = as.factor(data.2$race_002)
data.2$complication_002 = as.factor(data.2$complication_002)

#data.2$ahrq_ccs_002 = as.factor(data.2$ahrq_ccs_002)
data.2$ahrq_ccs_002 = as.numeric(data.2$ahrq_ccs_002)

str(data.2)


tabl.2 =table(data.2$asa_status_002,data.2$complication_002)
prop.table(tabl.2,margin = 1)


cor(data.2$ccsMort30Rate_002,data.2$ccsComplicationRate_002)




data = data.2

data$ahrq_ccs_002 = as.factor(data$ahrq_ccs_002)

table(data$ahrq_ccs_002)

dmy <- dummyVars(" ~ .-complication_002-gender_002", data = data, fullRank = T)
dat_transformed <- data.frame(predict(dmy, newdata = data))





model = glm(complication_002~., data=data.2, family = 'binomial')

summary(model)

library(car)


m1= glm(data.2$complication_002~data.2$ccsComplicationRate_002+ahrq_ccs_002+data.2$Age_002+data.2$ccsMort30Rate_002, data = data.2, family = 'binomial')
summary(m1)
vif(m1)

library(mltools)
library(data.table)
str(data.2)



library(caret)
str(data.2)
dummy.2 <- dummyVars(" ~ .-complication_002-gender_002-mort30_002", data = data.2, fullRank = T)
data_dummy.2 <- data.frame(predict(dummy.2, newdata = data.2))

data_dummy.2$gender_002 = data.2$gender_002
data_dummy.2$mort30_002 = data.2$mort30_002
data_dummy.2$complication_002 = data.2$complication_002
str(data_dummy.2)


###
## add train test split

smp_size.2<-floor(0.7*nrow(data_dummy.2))
set.seed(1024)
trainingdata.2 <- sample(seq_len(nrow(data_dummy.2)),size=smp_size.2)
training.2<-data_dummy.2[trainingdata.2,]
testing.2<-data_dummy.2[-trainingdata.2,]




## vif
#########3

model.2 = glm(complication_002~.,data = training.2,family = 'binomial')
summary(model.2)
with(model.2,pchisq(null.deviance-deviance,df.null-df.residual,lower.tail = F))

# model is significant

anova(model.2,test = 'Chisq')

#############

summary(model)

########

## uses AIC 
model_step = step(glm(complication_002~.,data = training.2,family = 'binomial'))

summary(model_step)


##########

p_random = predict(Randomforest_002,type = 'response',newdata = testing.2)
length(p_random)
length(actual)

actual = testing.2$complication_002
p_random

tab = table(p_random,actual = actual)

acc <- function(mod, p,actual) {
  out = c()
  ## Classification table
  #pred <- ifelse(p<pp,0,1)
  pred = p
#  pred_test <- ifelse(p_test<pp,0,1)
  tab<- table(pred,actual = actual)
  out$sumtab<- addmargins(tab,FUN=sum)
  
  
  TAP <- sum(tab[,2])   #Total actual positives
  TAN <- sum(tab[,1])   # Total actual negatives
  
  TP <- out$sumtab[2,2]
  TN <- out$sumtab[1,1]
  FP <- out$sumtab[2,1]
  FN <- out$sumtab[1,2]
  out$TPR = TP/TAP  # Sensitivity or recall ## ability to correctly classify 
  out$FPR = FP/TAN    
  out$TNR = TN/TAN   # Specificity
  out$FNR = FN/TAP
  out$accuracy = (TP+TN)/(TAN+TAP)
  out$miss_classification_error = 1-out$accuracy
  
  out$precision = TP/(TP+FP)
  # conditional probability of being positive when predicted positive
  out$specificity <- TN/TAN
  out$f_score = TP/(TP+0.5*(FP+FN))
  #out$cut_off = pp
  out$youden = out$TPR+out$TNR-1
  return(out)
}




acc(Randomforest_002,p= p_random,actual)




acc(model_step,0.5, p,actual)$youden
acc(model_step,0.4, p,actual)$youden
acc(model_step,0.3, p,actual)$youden
acc(model_step,0.2, p,actual)$youden
acc(model_step,0.1, p,actual)$youden
acc(model_step,0.25, p,actual)$youden
acc(model_step,0.24, p,actual)
acc(model_step,0.238, p,actual)$youden

install.packages('cutpointr')
library(cutpointr)
youden(32,20,541,207)

youden(1386,677,10268,2304)


str(data_dummy.2)






attach(data_dummy.2)
Age_002 = (Age_002 - mean(Age_002))/sd(Age_002)
bmi.3= (bmi.3 - mean(bmi.3))/sd(bmi.3)
ccsComplicationRate.3= ( ccsComplicationRate.3- mean(ccsComplicationRate.3))/sd(ccsComplicationRate.3)
ccsMort30Rate.3= (ccsMort30Rate.3 - mean(ccsMort30Rate.3))/sd(ccsMort30Rate.3)
complication_rsi.3= ( complication_rsi.3- mean(complication_rsi.3))/sd(complication_rsi.3)

attach(data_dummy.2)
Age_002 = (Age_002 - mean(Age_002))/sd(Age_002)
bmi_002= (bmi_002 - mean(bmi_002))/sd(bmi_002)
ccsComplicationRate_002= ( ccsComplicationRate_002- mean(ccsComplicationRate_002))/sd(ccsComplicationRate_002)
ccsMort30Rate_002= (ccsMort30Rate_002 - mean(ccsMort30Rate_002))/sd(ccsMort30Rate_002)
complication_rsi_002= ( complication_rsi_002- mean(complication_rsi_002))/sd(complication_rsi_002)




library(randomForest)
library(tree)


Randomforest_002= randomForest(complication_002~., data = training.2)
print(Randomforest_002) 
importance(Randomforest_002)
varImpPlot(Randomforest_002)


treemod.2= tree(training.2$complication_002~., data=training.2)
summary(treemod.2)

plot (treemod.2)
text(treemod.2,pretty=0)

varImpPlot(treemod.2)
p1<-predict(treemod.2,training.2)


pred_randomforest<-predict(Randomforest_002,testing.2,type = 'Response')
prediction1<-ifelse(p1>0.5, 1,0)



pred_randomforest


summary(model_step)










data_dummy.2$bmi_002 = data_dummy.2
