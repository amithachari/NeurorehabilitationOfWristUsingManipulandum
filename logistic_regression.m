input_raw=readtable('covergred_data_physiotherapist.csv');
input_final=table2array(input_raw);
output_raw=readtable('physio_output_final.csv');
output_final=table2array(output_raw);
m=length(input_final);
x_train=[ones(m,1),input_final(:,1:5)];
ytrain=output_final(:,2);
xtrain=zscore(x_train(:,1:end));% Normalizing the input features
using z-standardization
x_test=xtrain;
y_test=ytrain; 
 
 
%Finding Cost of logistic function and applying gradient descent
iter=1000; % No. of iterations for weight updation 
 
 
theta=zeros(size(xtrain,2),1); % Initializing all weights as zero
alpha=0.1 % Learning rate
[J grad h th]=cost(theta,xtrain,ytrain,alpha,iter) % Cost oflogistic function
ypred=x_test*th; % prediction of target variables
% Sigmoid application followed by thresholding to 0.5
[hp]=sigmoid(ypred); % Hypothesis Function
ypred(hp>=0.5)=1;
ypred(hp<0.5)=0;
%%%cost function%%
function [J grad h th] = cost(theta, xtrain,ytrain,alpha,iter)
th=theta
m=size(xtrain,1);
for j=1:iter
h=sigmoid(xtrain*th);
J=-(1/m)*sum(ytrain.*log(h)+(1-ytrain).*log(1-h));
th=th+(alpha/length(xtrain))*xtrain'*(ytrain-h)
end
grad=zeros(size(theta,1),1);
for i=1:size(grad)
grad(i)=(1/m)*sum((h-ytrain)'*xtrain(:,i));
end
end
