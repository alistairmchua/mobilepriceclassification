##loading the dataset

library(tidyverse)

library(caret)

install.packages("recipes", dependencies = TRUE)

#loading csv file into a dataframe 
df <- read.csv("mobileprice_train.csv")

str(df)
summary(df)

table <- table(df$price_range)# seeing the distributions
table
prop.table(table)

#checking for missing values
colSums(is.na(df)) #no missing values

##prepping for GLM 

#this will be our target variable, price_range
df$price_range <- as.factor(df$price_range)

#using sample function since i couldnt get caret to load
set_seed(2160)

train_index <- sample(1:nrow(df), 0.7 *nrow(df))

train <- df[train_index, ]
test <- df[-train_index, ]
