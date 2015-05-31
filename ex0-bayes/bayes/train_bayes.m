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

% estimate the parameters of py = p(y = i) �����������
py = zeros(1, y_size);
for i = 1:y_size
    py(i) = length(find(labels == i)) / N;
end

% estimate the parameters of pxy = p(xi = j  | y = k) ��������������
smooth_strength = 1;  % ��ֹ0����,������˹ƽ��
pxy = zeros(D, x_size, y_size);
for i = 1:y_size %����ÿһ��
    y_sam = data(find(labels == i), :);%index data
    y_sam_size = length(y_sam(:,1));%length
    for j = 1:D  %����ÿһ������   
        for k =1:x_size  %����������ÿһ�����
            nom = length(find(y_sam(:,j) == k)) + smooth_strength;
            denom = y_sam_size + smooth_strength * x_size;
            pxy(j, k, i) = nom / denom;
        end
    end
end

model.py = py;
model.pxy = pxy;
