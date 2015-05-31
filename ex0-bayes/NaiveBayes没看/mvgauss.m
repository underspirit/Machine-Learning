function mvgp = mvgauss(x,mean,cov)
%Calculates the probability of an observation x with a
%multivariate normal distribution

d = length(mean);
t1 = det(cov)^0.5;
coef = (1/((2*pi)^(d/2))*t1);
dif = x-mean;
dift = dif';
pdist = exp(-0.5*dif*inv(cov)*dift);
mvgp = coef*pdist;

