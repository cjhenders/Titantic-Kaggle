library(caret)
library(readr)

#Import Data
train <- read_csv("~/Documents/Kaggle Club/Titantic/train.csv")
test <- read_csv("~/Documents/Kaggle Club/Titantic/test.csv")

#Data Cleanup
train$Ticket = NULL
train$Embarked = NULL
train$Sex = as.factor(train$Sex)
train$PassengerId = NULL
train$Cabin = NULL
train$Age[is.na(train$Age)] = -1
train$Name = NULL
train$Survived = as.factor(train$Survived)

test$Ticket = NULL
test$Embarked = NULL
test$Sex = as.factor(test$Sex)
test$PassengerId = NULL
test$Cabin = NULL
test$Name = NULL
test$Age[is.na(test$Age)] = -1
test$Fare[is.na(test$Fare)] = median(test$Fare, na.rm=TRUE)

#Training Model
set.seed(100)
rf_model = train(Survived ~., data = train, method = "rf")