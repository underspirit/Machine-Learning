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
load('data.mat');%�������ݼ�
data = irst(:, 1 : 4);  %ѵ������
labels = irst(:, 5);    %ѵ�����ݶ�Ӧ�ı�ǩ,1��ʾ�ǲ��鶯��,2��ʾ���鶯��

% train naive bayes classifier
TRAIN = 20;        % number of training samples
model = train_bayes(data(1:TRAIN, :), labels(1:TRAIN));

% Ԥ�������һ�����������
p_labels = test_bayes([2 1 2 1], model)

% compute accuracy
% Accuracy=length(find(p_labels == labels)) / length(p_labels);
