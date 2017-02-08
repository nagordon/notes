# Optimization
# minimzes by default
make.NegLogLik <- function(data,fixed=c(FALSE,FALSE)) {
  # data is a vector of data to fit
  # fixed are the parameters to fit to
  params <- fixed
  function(p) {
    # parameters to optimize over
    params[!fixed] <- p
    mu <- params[1] # mean
    sigma <- params[2] # stdev
    a<- -0.5*length(data)*log(2*pi*sigma^2)
    b<- -0.5*sum((data-mu)^2)/(sigma^2)
    -(a+b)
  }
}

set.seed(1)
normals<-rnorm(100,1,2)
nLL <- make.NegLogLik(normals)
nLL
ls(environment(nLL))

# optim when >1 variables
optim(c(mu=0,sigma=1),nLL)$par

#fixing sigma = 2
nLL <- make.NegLogLik(normals, c(FALSE,2))
optimize(nLL,c(-1,3))$minimum

# fixing mu = 1, use optimize with only 1 variable
nLL <- make.NegLogLik(normals,c(1,FALSE))
optimize(nLL,c(1e-6,10))$minimum

# plot 1
nLL <- make.NegLogLik(normals,c(1,FALSE))
x<-seq(1,3,len=100)
y<-sapply(x,nLL)
plot(x,exp(-(y-min(y))),type = "l")

# plot 2
nLL <- make.NegLogLik(normals, c(FALSE,2))
x<-seq(0.5,2.5,len=100)
y<-sapply(x,nLL)
plot(x,exp(-(y-min(y))),type = "l")
