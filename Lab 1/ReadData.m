function [X,Y] = ReadData()
data = load("LC_data.mat");
X = data.X;
Y = data.Ff;
end
