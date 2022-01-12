data = read.csv(file.choose())
names(data)
library(car)
vif(lm(PCREV~BED+MCDAYS+TDAYS+factor(RURAL)+NSAL+FEXP,data=data))
#Excluded tdays as its value is greater than 4 implying it is highly correlated(also for >10)
vif(lm(PCREV~BED+MCDAYS+factor(RURAL)+NSAL+FEXP,data=data))
fit = lm(PCREV~BED+MCDAYS+factor(RURAL)+NSAL+FEXP,data=data)
summary(fit)

cookout = max(cooks.distance(fit))
if(cookout>1){
  print("Influential Observation present")
  tc=which(cooks.distance(fit)==cookout)
  PCREV=PCREV[-tc]
  BED=BED[-tc]
  MCDAYS=MCDAYS[-tc]
  NSAL=NSAL[-tc]
  FEXP=FEXP[-tc]
  RURAL=RURAL[-tc]
}
cookout
#if cookout>1, there are high leverage values
#here we dont have any high leverage value in th emodel as max cookout=0.77343

res = residuals(fit)
stdres = res/(sd(res))
pout=max(abs(stdres))
pout
#should be between -3 and 3 (normal distribution)
#our value is greater than 3 i.e. 3.785

if(pout>2.5){
  print("Outlier present")
  t=which(abs(stdres)==pout)
  PCREV=PCREV[-t]
  BED=BED[-t]
  MCDAYS=MCDAYS[-t]
  NSAL=NSAL[-t]
  FEXP=FEXP[-t]
  RURAL=RURAL[-t]
}
pout

length(PCREV)
