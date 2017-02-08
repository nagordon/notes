##Data types lecuture notes

#Objects
##Character
##Numberic (real numbers)
##Integers
##Complex
##Logical (T/F)

#vectors contain multiple copies of a single type of object
##vectors can't have mixed types of objects

#List
##The one type of vector can have different objects of different classes

vector()
#creates empty vector

#Number
##Generally treated as numeric objects

#Integer
##To explicitly designate a number a integer specify the L suffix
1
##Numeric object
1L
##Integer

Inf
##Infinity

NaN
##undefined value (not a number) or missing value

#R objects have Attributes
##Names, dimnames (dimension names)
##dimensions (e.g. matrices, arrays) number of rows and columns
##Class
##Length
##Other user defined attributes/metadata


#We type expresions into the R prompt
x=1
x
# you get [1] 1 the [1] indicates that x is a vector and 1 is the first element
##should show "1"

x=1:20
##makes x a sequence from 1 to 20 (this is an integer sequence)
x

c()
#The c() function is used to create vectors of objects
a=c(0.5, 0.6) ##numeric
b=c(TRUE, FALSE) ##Logical
c=c(T,F) ##Logical
d=c("a","b","c") ##character
e=9:29 ##integer
f=c(1+0i, 2+4i) ##complex

vector()
##use to create a vector of a certain type and length
x=vector("numeric", length=10)
x ##defult values are 0

#Mixing objects
##Creates the least common denomenator for the vector
x=c(1.7, "a") ##character
y=c(TRUE, 2) ##Numeric T=1 F=0
z=c("a", TRUE) ##character TRUE becomes a string T,R,U,E

#Coercing objects from one class to another
##as.* functions
x=0:6
class(x)
# [1] "integer"
as.numeric(x)
# [1] 0 1 2 3 4 5 6
as.logical(x)
# [1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
as.character(x)
#[1] "0" "1" "2" "3" "4" "5" "6" ##each in quotes is a string
as.complex(x)
# [1] 0+0i 1+0i 2+0i 3+0i 4+0i 5+0i 6+0i
##if coercion can't happen you get NA

##Slide 12
#Row,Column

##Slide 17
x=1:3
y=10:12
cbind(x,y)
##     x  y
##[1,] 1 10
##[2,] 2 11
##[3,] 3 12
rbind(x,y)
##  [,1] [,2] [,3]
##x    1    2    3
##y   10   11   12

##slide 18
#Lists
x=list(1,"a",TRUE,1+4i)
x
##[[1]] elements are indexed by double brackets
##[1] 1

##[[2]]
##[1] "a"

##[[3]]
##[1] TRUE

##[[4]]
##[1] 1+4i

##Slide 19-20
#Factors
x=factor(c("yes","yes","no","yes","no"))
x
##[1] yes yes no  yes no 
##Levels: no yes
table(x) ##Gives frequecy count
## no yes 
##  2   3
unclass(x) ##strips out the class
##[1] 2 2 1 2 1  ##down to an integer vector
##attr(,"levels") ##levels attribute of no and yes
##[1] "no"  "yes"

##slide 21
x=factor(c("yes","yes","no","yes","no"), ##defult is "no" as the baseline level b/c alphabetical order
         levels=c("yes","no")) ## sets "yes" as the baseline level (no is first)
x
##[1] yes yes no  yes no 
##Levels: yes no

##slide 16 17
#missing values can have different classes
##NaN = missing value (undefined math operations)
##NA = missing value (everything else)
is.na() ##tests for objects that are na
is.nan() ## tests for NaN all NaN values are NA but not all NA values are NaN

##slide 22
##data frames: stores tabular data
##unlike matrices, they have store objects of different classes
##This is pretty much a data set



