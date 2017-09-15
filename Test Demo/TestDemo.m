%*****************************************************************
%Description: Taking Flevoland dataset as an example to test the CV-CNN performance
%input: pretrained model -- cv_cnn 
%       test data -- test_img_Flevoland.mat  (a four-dimensional complex matrix produced by a 12*12 sampling window on T matrix )
%output: classification result
%*****************************************************************
clc; clear all;
addpath('../CV-CNN');
addpath('../CV-CNN./utils');
load ./model/cv_cnn;
load T_L2; load train_data;
%% prepare data for test
nwin = 12;                             % sampling window
[test_img_Flevoland] = data_for_test(train_data,T11L,T12L,T13L,T22L,T23L,T33L,nwin);
%% testing
disp('testing...');
net = cv_cnn_ff(cv_cnn,test_img_Flevoland);     % test based on the pretrained model
test_img_oo = net.o;                        % test output

%% classification
% imshow the classification image
disp('imshow the classification image...');
load ground_truth.mat;
figure,imshow (ground_truth);title('Ground Truth')               % the ground truth of Flevoland
[class_img,ImageRGB] = test_imaging(test_img_oo);

% calculate the accuracy
disp('calculate the accuracy...');
load label;                                 % the label of Flevoland
[accuracy, confusion_matrix] = calculate_acc(label,class_img);




