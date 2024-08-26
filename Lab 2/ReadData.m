function [X,Y] = ReadData()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
data= load("LC_data.mat");
X = data.X;
Y1 = data.Y1;
Y2 = data.Y2;
Y = [Y1; Y2];
end
