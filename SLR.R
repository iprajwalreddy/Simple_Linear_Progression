#Simple Linear Regression

#Removing the previous data
rm(list = ls())

#Importing the data
dataset = read.csv('Salary_Data.csv')

#Splitting the data into train and test models
library(caTools)
set.seed(123)
?sample.split()
split = sample.split(dataset$Salary,SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset,split == FALSE)

#Fitting Simple Linear Regression model to the training set
regressor = lm(formula = Salary ~ YearsExperience, data = training_set)

#Used to check the model  
summary(regressor)

#Predicting the Test Set Results
y_pred = predict(regressor, newdata = test_set)

#Visualising the training_set
install.packages('ggplot2')
library('ggplot2')

ggplot() + 
  geom_point(aes(x = training_set$YearsExperience,y = training_set$Salary),colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor,newdata = training_set)),colour = 'blue') +
  ggtitle('Salary vs YearsExperience in R(training set)') +
  xlab('Years of Experience') + 
  ylab('Salary')

#Visualising the test_set

ggplot() +
  geom_point(aes(x= test_set$YearsExperience,y = test_set$Salary),colour = 'red') +
  geom_line(aes(x=training_set$YearsExperience,y=predict(regressor,newdata = training_set)),colour = 'blue') +
  ggtitle('Salary vs Experience in R(test set)') + 
  xlab('Years of Experience') +
  ylab('Salary')
