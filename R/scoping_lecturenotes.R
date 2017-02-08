##Scoping Rules

search()
##global env. is the users workspace
##when you load a package it get placed second on the list

f<-function(x,y){
  x^2+y/z ##z is a free variable
}

make.power<-function(n){
  pow<-function(x){
    x^n
  }
  pow
}

cube<-make.power(3)
square<-make.power(2)
cube(3)

square(3)

ls(environment(cube))
get("n", environment(cube))

y<-10
f<-function(x){
  y<-2
  y^2+g(x)
}
g<-function(x){
  x*y
}
f(3)
##in the f function g is a free variable
##in the function g y is a free variable

