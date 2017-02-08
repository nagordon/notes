# hmk 1


rm(list=ls())

setwd("E:/Computing for Data Analysis with R/hmk1")
con <- file("hw1_data.csv","r")
data <- read.csv(con)
readLines(con,10) # read specific lines of data
close(con)
data[1:2,]
length(data[,1])
str(data)
last <- length(data[,1])
nrow(data) == length(data[,1])
data[c(last-1,last) ,]
data$Ozone[47]
data$Ozone[47] == data[47,"Ozone"]
# data[["Ozone"]] == data["Ozone"]     what is different?

sum(is.na(data$Ozone))

mean(data$Ozone[!is.na(data$Ozone)])

# Extract the subset of rows of the data frame where 
#  Ozone values are above 31 and Temp values are above 90. 
#  What is the mean of Solar.R in this subset?

k1 <- data$Ozone > 31 & !is.na(data$Ozone)
k2 <- data$Temp > 90 & !is.na(data$Temp)
k3 <- !is.na(data$Solar.R)

mean(data$Solar.R[k1&k2&k3])

### Question 9

mean(data$Temp[data$Month == 6])

# Question 10
rm(k1)
k1 = !is.na(data$Ozone) & data$Month==5
max( data$Ozone[k1] )
