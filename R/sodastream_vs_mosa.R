# sodastream vs mosa payback curve


# fixed cost
sscost <- 130
mosacost <- 50
storecost <- 1

# variable cost
ssrefillunitcost <- 15/60 # or 50/130
mosarefillunitcost <- 8/10
storerefillunitcost <- 0

# plot
liters <- 1:300
sstotalcost<- sscost + ssrefillunitcost*liters
mosatotalcost <- mosacost+ mosarefillunitcost*liters
storetotalcost <- storecost*liters 
plot(liters,sstotalcost,type="n")
lines(liters,sstotalcost,col="red")
lines(liters,mosatotalcost,col="green")
lines(liters,storetotalcost,col="blue")
title('Cost Comparison of cost of club soda production')
legend("bottomright", c("sodastream","mosa","store"), fill=c("red","green","blue"))