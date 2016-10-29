#Must install packages first using install.packages("insert_package_name")
library(readr)
library(randomForest)
library(caret)
library(ggplot2)
library(dplyr)
library(stringr)
library(corrplot)

set.seed(231)
#Navigating through directory
setwd("/Users/fi/Documents/GitHub/") # Set own path

#Importing data in two different ways 
train <- read.csv("crime.csv", stringsAsFactors=FALSE)

#Previewing data 
head(train)
nrow(train)
ncol(train)

#Check number of NA values
sapply(train, function(x) sum(is.na(x)))

#For the time being, Lets remove the NA rows so we can see the basic relationships
train2 = train[complete.cases(train),]
(nrow(train) - nrow(train2))/nrow(train) # the number of rows that are NA values

# Convert Date into separate columns
# https://www.kaggle.com/anu2analytics/d/mchirico/philadelphiacrimedata/crime-graph-r/code
train$dt = as.Date(train$Dispatch_Date)
train$year = as.numeric(format(train$dt, "%Y"))
train$mth = as.numeric(format(train$dt, "%m"))
train$day = as.numeric(format(train$dt, "%d"))

#Correlation Matrix
M <- cor(train2[sapply(train, function(x) !is.character(x))]) 
corrplot(M, method = "number", order = "hclust",type='lower', diag=F, addCoefasPercent=T, )

# Well, given these characteristics there really no significant relationships to look at the moment
# Ergo, we should actually add to this dataset.

# We can break down the date and time columns to 
ggplot(train,aes(x = Psa)) + geom_bar()

# Order the data
train2 <- train[order(train$year, train$mth, train$day),] 


ggplot(train,aes(x = Psa)) + geom_bar()
