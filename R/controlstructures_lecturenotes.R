##Week 2

##Control Structures
#Consider the following R code
if(x > 1) {
  print("x is big")
} else if(x > 0) {
  print("x is positive")
} else {
  print("x is negative or zero")}
##How does it differ from:
  if(x > 1) {
    print("x is big")
  }
  if(x > 0) {
    print("x is positive")
  }
  print("x is negative or zero")
##The else lets you look define "x" as one of the three choices
  
##For loops
for(i in 1:10) {print(i)}

##The following for loops are the same
<-c("a","b","c","d")

for(i in 1:4){
   print(x[i])}

for(i in seq_along(x)){
  print(x[i])}

for(letter in x) {
  print(letter)}

for (i in 1:4) print(x[i])

##Nested for loops
x<-matrix(1:6,2,3)
x
for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i,j])
  }
}


for(i in 10:1) {print(i)}
##prints 1:10 backwards

##while loop
count<-0
while(count<10){
  print(count)
  count<-count+1
}
##this loop makes things easy to read

z<-5
while(z>=3 && z<=10) {
  print(z)
coin<-rbinom(1,1,0.5)

if (coin==1){ ##random walk
z<-z+1}
else { z<-z-1}
}

##repeat
#usually better off using a for loop with a hard limit

##next, return
for(i in 1:100) {
  if (i<=20) ##skip the first 20 iterations
}

