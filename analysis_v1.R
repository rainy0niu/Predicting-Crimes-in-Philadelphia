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
setwd("/Users/fi/Documents/GitHub/Predicting-Crimes-in-Philadelphia") # Set own path

#Importing data in two different ways 
train <- read.csv("crime.csv", stringsAsFactors=FALSE)

#Previewing data 
head(train)
nrow(train)
ncol(train)

#For the time being, Lets remove the NA rows so we can see the basic relationships
train2 = train[complete.cases(train),]
nrow(train2)

#Correlation Matrix
M <- cor(train2[sapply(train, function(x) !is.character(x))]) 
corrplot(M, method = "number", order = "hclust",type='lower', diag=F, addCoefasPercent=T, )

# Well, given these characteristics there really no significant relationships to look at the moment
# Ergo, we should actually add to this dataset.

# We can break down the date and time columns to 
ggplot(train,aes(x = Psa)) + geom_bar()
