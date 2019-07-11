#Data Preprocessing

#importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#Importing the dataset
dataset = pd.read_csv('Salary_data.csv')

#Splitting into dependent and independent matrices
X = dataset.iloc[: , :-1].values
Y= dataset.iloc[:, 1].values

#Splitting the data into train and test models
from sklearn.model_selection import train_test_split
X_train,X_test,Y_train,Y_test = train_test_split(X,Y,test_size = 1/3,random_state = 0)

#Feature scaling is not included since the Simple Linear Regression algorithm does it on its own if necessary

#Training the model
from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(X_train,Y_train)

#Predicting the test results
Y_pred = regressor.predict(X_test)

#Visualizing the training set results
plt.scatter(X_train,Y_train,color = 'red')
plt.plot(X_train,regressor.predict(X_train),color = 'blue')
plt.label('Experience vs Salary(Training Set)')
plt.xlabel('Experience')
plt.ylabel('Salary')
plt.show()

#Visualizing the test set results
plt.scatter(X_test,Y_test,color = 'red')
plt.plot(X_train,regressor.predict(X_train),color = 'blue')
plt.label('Experience vs Salary(Test Set)')
plt.xlabel('Experience')
plt.ylabel('Salary')
plt.show()