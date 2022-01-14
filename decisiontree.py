import pandas as pd
import numpy as np
from id3 import Id3Estimator
data=pd.read_csv('covergred_data_physiotherapist.csv')   #input file
output=pd.read_csv('physio_output_final.csv')            #output
file
input_vals=[]
#input_scale=preprocessing.scale(input_vals)
for i in range(66):
a=data.loc[i].values.astype('float64')
#serializing data frame and subsequent
input_vals.append(a)
#extraction of values from series
op=output['Condition_disabled'].values.astype('float64')
estimate= Id3Estimator()
#fit input features with the classification labels
estimate.fit(input_vals[0:45],op[0:45])
#Testing on subset of data available. Ranges are modified #in case
of cross-validation
prediction=estimate.predict(input_vals[46:66])
print(prediction)
print(op[46:66])
