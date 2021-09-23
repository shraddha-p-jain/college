m<- 64
a <-33
c<- 12
x0 <- 57
n<-100
r<- numeric(n)
r[1]<-x0
for(i in 1:(n-1))
  r[i+1]<-(a*r[i]+c)%%m
r

LCG <- function(n,m,a,c,x0){
  r<- numeric(n)
  r[1]<-x0
  for(i in 1:(n-1))
    r[i+1]<-(a*r[i]+c)%%m
  r<-r/m
  return(r)
}

LCG(400,1024^2,3,7,19)->rn
rn

LCG(400,1024^2,271,7,19)->rn2

## chi-sq test
# x<- vector, k<- bins, a <- level of significance
rnchi <- function(x,k,a){
  z<-cut(x,0:k/k, labels = FALSE)
  z[is.na(z)]<-0
  o<-c()
  for(i in 1:k)
    o[i]<-sum(z==i)
  E<-c()
  for(i in 1:k)
    E[i]<-(1/k)*length(x)
  chi.square<-sum((o-E)^2/E)
  if(chi.square>qchisq(a/2,df=k-1)&&
     chi.square<qchisq(a/2,df=k-1,lower.tail = FALSE))
    return(list("accepted",chi.square))
  else
    return(list("Rejected", chi.square))
}
rnchi(rn,10,0.05)

ks.test(rn2,"punif",alternative = "less")

ks.test(rn2,"punif",alternative = "less")
