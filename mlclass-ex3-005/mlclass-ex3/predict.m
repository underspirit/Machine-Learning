function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

% ����a�����ÿһ�д���һ��������ĳһ��ļ���ֵ
X = [ones(m, 1) X]; %add bias unit
z2 = Theta1 * X';
a2 = sigmoid(z2);
a2 = [ones(1, m); a2];   %add bias unit
z3 = Theta2 * a2;
a3 = sigmoid(z3);
[a, p] = max(a3', [], 2);    %������Ҫ��a3ת��,��Ϊ���Ҫ��pΪһ��������

% ����,����a�����ÿһ�д���һ��������ĳһ��ļ���ֵ
% X = [ones(m, 1) X];%add bias unit
% 
% a2 = sigmoid(X * Theta1');   % �ڶ��㼤������
% a2 = [ones(m, 1) a2];         %add bias unit
% a3 = sigmoid(a2 * Theta2');  
% [aa,p] = max(a3,[],2);               % ����Ҫת��a3










% =========================================================================


end
