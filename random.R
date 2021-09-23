x0 = 4
a=13
c=0
m=64
rnum = c()
i=1
y=x0

while(TRUE){
  rnum=c(rnum,y)
 y=(a*y)%%m
 if(y==x0){
  break
  }
}
rnum
