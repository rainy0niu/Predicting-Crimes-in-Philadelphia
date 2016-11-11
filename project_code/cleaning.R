setwd("/Users/Erik's PC/Desktop/Project/")

#call libraries
library(readr)
library(randomForest)
library(caret)
library(ggplot2)
library(dplyr)
library(stringr)
library(corrplot)

#read CSV
train <- read.csv("crime.csv", stringsAsFactors=FALSE)
#Previewing data 


#get rid of NA values
train2 = train[complete.cases(train),]
nrow(train2)

head(train2)
nrow(train2)
ncol(train2)

# To change plot order of bars, change levels in underlying factor
reorder_size <- function(x) {
  factor(x, levels = names(sort(table(x))))
}
plot <- ggplot(train2, aes(reorder_size(Text_General_Code))) + geom_bar(fill="#56b4e9")

#format axis
plot + theme(axis.text.x = element_text(angle=90)) + xlab("Crimes")+ ylab("Count") + ggtitle("Crime Occurances")

#get unique values for type of crime
unique_crimes = unique(train2$Text_General_Code, incomparables = FALSE)

#get dimensions of data
dim(train2)

#order data by date
train2$Month <- as.yearmon(train2$Month)  # This didn't work
train2[order(train2$Month),]
#find last years
head(train2)

#Get 
