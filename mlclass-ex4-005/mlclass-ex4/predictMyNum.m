function c = predictMyNum(imgPath, Theta1, Theta2)
%PREDICTMYNUM Summary of this function goes here
%   Detailed explanation goes here
img = imread(imgPath);
img = rgb2gray(img);
img = double(img)/255;
img = img(:)';
c = predict(Theta1, Theta2, img);
end

