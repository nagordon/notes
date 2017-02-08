#### quiz 2 ####
# x<-1:10
# if(x>5) {
#  x<-0
# }

library(datasets)
data(iris)
?iris
str(iris)
# take the mean of sepal width for all Species
tapply(iris$Sepal.Length,iris$Species,mean)

ind <- iris$Species == "virginica";ind
mean(iris$Sepal.Length[ind])

iris[,1:4]
apply(iris[,1:4],2,mean) # take the mean of the columns

# question 6
rm(list=ls())
library(datasets)
data(mtcars)
str(mtcars)
# How can one calculate the average miles per gallon (mpg) 
#    by number of cylinders in the car (cyl)?
?apply
?tapply
tapply(mtcars$mpg,mtcars$cyl,mean)
#same answer with apply
dat<-split(mtcars$mpg,mtcars$cyl);dat
sapply(dat,mean)

# question 7
# Continuing with the 'mtcars' dataset from Question 6, 
#   what is the absolute difference between the average
#   horsepower of 4-cylinder cars and the average horsepower
#   of 8-cylinder cars?

str(mtcars)
dat<- tapply(mtcars$hp,mtcars$cyl,mean)
str(dat)
range(c(1,3))
abs(dat["8"] - dat["4"])


# question 8
?lapply
?sapply
# 'lapply' always returns a list while 'sapply' attempts to simplify the result.

# question 9
# 16

f <- function(x) {
  g <- function(y) {
    y + z
  }
  print(x)
  z <- 4
  x + g(x) # 3 + g(3) # 3 + y+z # 3+3+4
}
# If I then run in R
z <- 10
f(3)


?debug


x<-c(1,2,3)
debug(mean)
mean(x)
