% main file for the naive bayes classifier
% data:  NxD matrix
%        each attribute can take on J distinct values, i.e. J=x_size
%        each class variable can take on K distinct values, i.e. K=y_size
% data info:
%        http://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+%28Original%29
%        UCI Machine Learning Repository
%        Breast Cancer Wisconsin (Original) Data Set
% Algorithm info: 
%        Machine Learning -- Tom M. Mitchell
%        Chapter 1 --  Generative and Discriminative Classifiers: 
%                      Naive Bayes and Logistic Regression

clc,clear;
load('data.mat');%加载数据集
data = irst(:, 1 : 4);  %训练数据
labels = irst(:, 5);    %训练数据对应的标签,1表示非哺乳动物,2表示哺乳动物

% train naive bayes classifier
TRAIN = 20;        % number of training samples
model = train_bayes(data(1:TRAIN, :), labels(1:TRAIN));

% 预测给定的一个样本的类别
p_labels = test_bayes([2 1 2 1], model)

% compute accuracy
% Accuracy=length(find(p_labels == labels)) / length(p_labels);
