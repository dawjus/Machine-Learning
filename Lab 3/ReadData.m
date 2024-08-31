function [X,Y] = ReadData()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
data = load("LC_data3.mat");
X = data.X;
Y = data.Y;
end
