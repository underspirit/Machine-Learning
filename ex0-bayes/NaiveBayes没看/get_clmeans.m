function clm = get_clmeans(data)
%Calculates the maximum likelihood estimations of the class means


novar = size(data,2)-1;
obsno = size(data,1);
if min(data(:,novar+1)) == 0 %if class labels start at 0
    data(:,novar+1) = data(:,novar+1)+1;
end%if
noclass = max(data(:,novar+1));

for itr=1:noclass
    idx = find(data(:,novar+1)==itr);    
    clm{itr} = ml_mean(data(idx,:)); 
end%for

