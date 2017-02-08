##Functions

#created using function()
mydata<-rnorm(100)
sd(mydata)
sd(x=mydata)
sd(x=mydata, na.rm=FALSE)
sd(na.rm=FALSE, x=mydata)
sd(na.rm=FALSE, mydata)
##All return the same value
##last two forms are not recommended

args(lm)

##defining a function
f<-function(a,b=a,c=2,d=NULL){
}
##NULL usually means there is nothing there

f<-function(a,b){
  a^2
  print(a)
  print(b)
}
f(2)
##2 is positionaly matched to a, so no error for not defining b 
##when you add print() then you get an error

##... argument


