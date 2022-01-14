import pandas as pd
import numpy as np
from sklearn import svm
data=pd.read_csv('covergred_data_physiotherapist.csv')   #input file
output=pd.read_csv('physio_output_final.csv')           #output file
input_vals=[]
#Files have stored DataFrames in them.
#This is done to extract the Serials first and then values from the
serials
for i in range(66):
a=data.loc[i].values.astype('float64')#serializing #data frame
and subsequent
input_vals.append(a)   #extraction of values from series
op=output['Condition_disabled'].values.astype('float64')
#For the function SVC, kernel used is RBF function. Other #values
are 'linear','poly',etc.
#Gamma denotes the curve of the seperating boundary.
classifier=svm.SVC(kernel='rbf', gamma=0.01,random_state=1)
#Fitting the classifier in the input values and training #labels.
Here the testing set is a manually chosen part of #the available
data
#This can be modifier for cross validation
y=classifier.fit(input_vals[0:45],op[0:45])
prediction=classifier.predict(input_vals[46:66])
#compare prediction and actual outputs
print(prediction)
print(op[46:66])
