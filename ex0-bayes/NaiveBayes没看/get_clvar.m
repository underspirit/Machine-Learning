function clcov = get_clvar(data)
%Calculates the variance of each attribute for each class in 
%a data set
%Variances are placed in a diagonal covariance matrix

d = size(data,2)-1;
if min(data(:,d+1)) == 0 %if class labels start at 0
    data(:,d+1) = data(:,d+1)+1;
end%if
C = max(data(:,d+1));

for itr=1:C
    idx = find(data(:,d+1)==itr); 
    %find the diagonal covariace matrix
    covt = ml_cov(data(idx,:));
    cov = zeros(d,d);
    for itrd=1:d
        cov(itrd,itrd)=covt(itrd,itrd);
    end
    clcov{itr} = cov; 
end%for

