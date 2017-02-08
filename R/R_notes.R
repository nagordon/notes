objects()   				# lists all object in use
x <- c(1,2,3,4,5)   			# creates 
p <- c(x,0,x)   				# concatenates vector x, 0, x
x[1]  					# returns first component of x
x[-2]   					# returns all values except x[2]
x==3  					# returns an array of logicals where x equal to 3
x[x==3]   				# returns the vector elements where the array is true
x.newval <- sum(x)			# can also use dots in variable names
help.start()   				# open help browse
?sum  					# returns documentation
help(sum) 				# returns documentation
help("[[")  				# help also works with syntax
rm(x)   # remove object
x<-1:4  					# creates an array 1 to 4 incrementing by 1
x<-rep(c(1,2,3,4),each=8);x 		 # uses rep() to repeat a vector of values
x <- seq(from = 1, to = 4, by= 1)		# creates a sequence of numbers
varname <- c("first","second","third")  	# defines strings
repvarname <- rep(varname,each=8)
newval <- cbind(rep(varname,each=3),1:3)   # cbind combines data or variables
newval[,1]  				# returns all row values of the first column
newval[-1,] 				# returns all column values of all rows except 1
z <- vector(length=6)  			# creates a null vector
Dmat <- matrix(nrow = 8, ncol = 4)  	# creates a null matrix
x1 <- c(1, 2, 3)
x2 <- c("a", "b", "c", "d")
x3 <- 3
x4 <- matrix(nrow = 2, ncol = 2)
x4[,1]<- c(1, 2)
x4[,2]<- c( 3, 4)
Y <- list(x1 = x1, x2 = x2, x3 = x3, x4 = x4)   # creates a list
Y$x1   					# access x1 data in list Y
names(Y) 				# returns all the entries in list Y
paste(1:5,6:9)   				# concatenates strings
x<-1:3;y<-c(1,4,5)
!x==y   					# x not equal to y
length(x)                             			# length
stderr <- function(x) sqrt(var(x)/length(x))                  # define function
array(1:20,dim=c(4,5))			# creates a matrix with dim 4x5 counting from 1-20
cube <- function(n) {			#
  sq <- function() n*n			#
  n*sq()					#
}					# embedded function

cube(4)
