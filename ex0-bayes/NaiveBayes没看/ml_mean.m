function mean = ml_mean(data)
%Calculate the maximum likelihood estimation of the mean


n = size(data,1);
d = size(data,2)-1;

mean = sum(data(:,1:d))./n;