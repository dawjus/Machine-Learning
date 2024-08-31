function Y01 = Y_to_Y01(Y)
%Y_TO_Y01.M Summary of this function goes here
%   Detailed explanation goes here
cols = size(Y,2);
Y01 = zeros(max(Y), cols);
for i=1:cols
    Y01(Y(i), i) = 1;
end