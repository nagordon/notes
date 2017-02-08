##apply
#used to apply functions to the rows or columns of a matrix

str(apply)
x<- matrix(rnorm(200),20,10)
apply(x,2,mean) ##spits back the means of each column in the matrix (2)
apply(x,1,sum) ##sum of each row (1)

x<-matrix(rnorm(200),20,10)
apply(x,1,quantile,probs=c(0.25,0.75)) ##get the 25th and 75th quantiles for each row

a<-array(rnorm(2*2*10),c(2,2,10)) ##this kinda creates a bunch (10) 2x2 matrices
apply(a,c(1,2),mean) ##this takes the mean of all the matrices (collapes the "3rd" dimension)