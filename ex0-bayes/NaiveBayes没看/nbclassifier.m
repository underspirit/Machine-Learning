%Gaussian Classifier
%Implementation of Naive Bayes Classifier
%Maximum Likelihood estimation is used to calculate the means 
%and variances of each class
%The class conditional probaility density functions p(x/C) are then
%calculated by using the multivariate Gaussian distribution
%Fianlly the posterior probabilities are calculated by using
%Bayes' rule


clear
clc
data =load('iris.txt');%load the data set
d = size(data,2)-1;%the dimensionality of the data
N = size(data,1);%the number of samples in the data set

%Determine the number of classes
if min(data(:,d+1)) == 0
    data(:,d+1)=data(:,d+1)+1;
    C = max(data(:,d+1));
else
    C = max(data(:,d+1));    
end
accr  = zeros(1,10);%contains the accuracies of each fold 

%Split the data into folds
%find the indices of the classes
for idxitr=1:C
    idxs{idxitr} = find(data(:,d+1)==idxitr);
end%for
%find out how many the test/validation observations are 
%required from each class
for idxitr=1:C
    csize(idxitr) = length(idxs{idxitr})./10;
end%for

for critr=1:10%cross-validation
%extract one of 10 folds of the data
tempd = [];
for clitr=1:C
    t_tidx = idxs{clitr};%the indices of all samples of this class
    tidx = t_tidx(floor(csize(clitr)*(critr-1)+1):floor(critr*csize(clitr)));%the indices of the test samples to be used of this class
    %tidx = t_tidx(csize(clitr)*(critr-1)+1:critr*csize(clitr));%the indices of the test samples to be used of this class
    tempd = [tempd; data(tidx,:)];
end%for te
fold{critr} = tempd;
end%for critr

for cvn=1:10
ds = ones(1,10);%flags to mark training folds
ds(cvn) = 0;%0 is the testing fold
te_idx = cvn;
tr_idx = find(ds == 1);

data_tr = [];
for fitr=1:9
    data_tr = [data_tr; fold{tr_idx(fitr)}]; 
end
data_te = fold{te_idx};
    
    clm=get_clmeans(data_tr);
    clcov=get_clvar(data_tr);
    trlabels = data_tr(:,d+1);
    telabels = data_te(:,d+1);
    
    %Get the class priors 
    for itr=1:C
        prior{itr} = length(find(trlabels==itr))/length(trlabels);
    end
    
    for itr=1:C
    %Determine the ML class means and covariances
    mean = clm{itr};
    %d = length(mean);
    cov = clcov{itr};
                          
    %Classify the test set
    %Determine the class conditional probabilities of the observations
    for obsn=1:size(data_te,1)
        x = data_te(obsn,1:d);
        postp(obsn,itr) = prior{itr}*mvgauss(x,mean,cov);        
    end%for
    end%for C    
    
    %Use Bayes' rule to calculate posterior probabilities
    %Classify the data
    [mv clabels] = max(postp');
    
    %Determine cross validation error rate
    %labels = labels - ones(1,length(labels));%make class labels from 0,...,C-1
    %length(find((labels(1:length(otel)) - otel))~=0)
    taccuracy(cvn) = 100 - (length(find(clabels' - telabels)~=0))/length(telabels)*100; 
end%cvn

acc = sum(taccuracy)/10