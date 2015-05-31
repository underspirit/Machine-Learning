function labels = test_bayes(data, model)
% Use Naive Bayes model to predict unkown data
% Input:
%       data  -  NxD matrix
%                each row indicates a sample
%                each column indicates an attribute
%       model  -  trained Naive Bayes model parameter
% Output:
%       labels  -  predicted class labels for data

[N, D] = size(data);           % sample parameter
y_size = length(model.py);     % number of class

labels = zeros(N, 1);
for i = 1:N
    prob = zeros(y_size, 1);
    for j = 1:y_size
        mult = 1;
        for k = 1:D
            mult = mult * model.pxy(k, data(i, k), j);
        end
        prob(j) = mult * model.py(j);
    end
    [dummy, res] = max(prob);   %找出最大概率,即为分类
    labels(i) = res;
end
