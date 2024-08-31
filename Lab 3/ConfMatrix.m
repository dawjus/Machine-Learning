function [] = ConfMatrix(Y, ypred)
%CONFMATRIX Summary of this function goes here
%   Detailed explanation goes here
C = confusionmat(Y, ypred);
disp(C);
