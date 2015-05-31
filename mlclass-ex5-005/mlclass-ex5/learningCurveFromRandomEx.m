function [error_train, error_val] = ...
    learningCurveFromRandomEx(X, y, Xval, yval, lambda)
% Number of training examples
m = size(X, 1);

% You need to return these values correctly
error_train = zeros(m, 1);
error_val   = zeros(m, 1);

% ====================== YOUR CODE HERE ======================
% In practice, especially for small training sets, when you plot learning curves
% to debug your algorithms, it is often helpful to average across multiple sets
% of randomly selected examples to determine the training error and cross
% validation error.
% Concretely, to determine the training error and cross validation error for
% i examples, you should randomly select i examples from the training set
% and i examples from the cross validation set. You will then learn the param-
% eters  using the randomly chosen training set and evaluate the parameters
%  on the randomly chosen training set and cross validation set. The above
% steps should then be repeated multiple times (say 50) and the averaged error
% should be used to determine the training error and cross validation error for
% i examples.
% For this optional (ungraded) exercise, you should implement the above
% strategy for computing the learning curves. For reference,figure 10 shows the
% learning curve we obtained for polynomial regression with  = 0:01. Your
% figure may differ slightly due to the random selection of examples.

% ---------------------- Sample Solution ----------------------

for i = 1:m
    %在训练集和cv集中各随机选取i个样本
    sel_train = randperm(size(X, 1));
    sel_val = randperm(size(X, 1));
    sel_train = sel_train(1 : i);
    sel_val = sel_val(1 : i);
    X_train_rd = X(sel_train, :);
    y_train_rd = y(sel_train, :);
    X_val_rd = Xval(sel_val, :);
    y_val_rd = yval(sel_val, :);
    
    %训练theta
    [theta] = trainLinearReg(X_train_rd, y_train_rd, lambda);
    %计算训练集误差,lambda=0,此时计算的集合是 训练时所用的集合
    error_train(i) = linearRegCostFunction(X_train_rd, y_train_rd, theta, 0);
    %计算cv误差,lambda=0,此时计算的集合是 随机选取的交叉验证集子集 ?????不懂
    error_val(i) = linearRegCostFunction(X_val_rd, y_val_rd, theta, 0);
end






% -------------------------------------------------------------

% =========================================================================

end
