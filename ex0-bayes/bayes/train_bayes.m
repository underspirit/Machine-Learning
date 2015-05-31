function model = train_bayes(data, labels)
% An implementation for training of naive bayes for discrete valued vectors
% Input:
%       data  -  data matrix
%                each row indicates a sample
%                each column indicates an attribute
%       labels  -  class label for each sample in data matrix
% Output:
%       model  -  model parameters

[N, D] = size(data);
y_size = max(labels);
x_size = max(max(data));

% estimate the parameters of py = p(y = i) 计算先验概率
py = zeros(1, y_size);
for i = 1:y_size
    py(i) = length(find(labels == i)) / N;
end

% estimate the parameters of pxy = p(xi = j  | y = k) 计算类条件概率
smooth_strength = 1;  % 防止0概率,拉普拉斯平滑
pxy = zeros(D, x_size, y_size);
for i = 1:y_size %对于每一类
    y_sam = data(find(labels == i), :);%index data
    y_sam_size = length(y_sam(:,1));%length
    for j = 1:D  %对于每一个特征   
        for k =1:x_size  %对于特征的每一种情况
            nom = length(find(y_sam(:,j) == k)) + smooth_strength;
            denom = y_sam_size + smooth_strength * x_size;
            pxy(j, k, i) = nom / denom;
        end
    end
end

model.py = py;
model.pxy = pxy;
