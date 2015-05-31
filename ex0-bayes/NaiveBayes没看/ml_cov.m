function cov = ml_cov(data)
%Calculate the maximum likelihood estimation of the covariance
%matrix 


n = size(data,1);
d = size(data,2)-1;%the last column is the class label

mean = ml_mean(data);
rmean = repmat(mean,n,1);%repeat the mean n times 

%sq = (data(:,1:d)-rmean).*(data(:,1:d)-rmean); 
datamm = (data(:,1:d)-rmean);
datammt = datamm';
sq = datammt*datamm;

cov = sq./n;
%save