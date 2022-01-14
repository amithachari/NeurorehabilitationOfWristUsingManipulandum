K-nearest neighbour
input_raw=readtable('covergred_data_physiotherapist.csv');
input_final=table2array(input_raw);
output_raw=readtable('physio_output_final.csv');
output_final=table2array(output_raw);
m=length(input_final);
X_train=[ones(m,1),input_final(:,2:5)];
Y_train=output_final(:,2);
[prediction, nn_index,
accuracy]=KNN(3,X_train,Y_train,X_train,Y_train); 
 
 
function [pred_lab,n_ind,acc] =
KNN(k,train_dat,train_lab,test_dat,test_lab)
pred_label=zeros(size(t_data,1),1);
ed=zeros(size(t_data,1),size(data,1)); %ed is the euclidean
distances
ind=zeros(size(t_data,1),size(data,1)); %corresponding indices
k_nn=zeros(size(t_data,1),k); %k-nearest neighbors for testing
sample (Mxk) 
 
 
%calc euclidean distances between each testing data point and the
training
%data samples
for test_p=1:size(t_data,1)
for train_p=1:size(data,1) 
 
 
%calc and store sorted euclidean distances with corresponding 
indices
ed(test_p,train_p)=sqrt(sum((t_data(test_p,:)-
data(train_p,:)).^2));
end
[ed(test_p,:),ind(test_p,:)]=sort(ed(test_p,:));
end
%find the nearest k for each data point of the testing data
k_nn=ind(:,1:k);
n_ind=k_nn(:,1);
%get the majority vote
for i=1:size(k_nn,1)
opt=unique(labels(k_nn(i,:)'));
max_c=0;
max_l=0;
for j=1:length(opt)
L=length(find(labels(k_nn(i,:)')==opt(j)));
if L>max_c
max_l=opt(j);
max_c=L;
 
end
 
end 
 
pred_label(i)=max_l;
 
end
