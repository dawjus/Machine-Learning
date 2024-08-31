function [X] = MapFea(X)
%MAPFEA Summary of this function goes here
%   Detailed explanation goes here
[rows,column]=size(X);
tmp = ones(1, column);

Tftf = X(1,:).*X(2,:);
tfTfTf = X(1,:).*X(2,:).*X(2,:);
Tftftf = X(2,:).*X(1,:).*X(1,:);
X = [tmp;X;Tftf; tfTfTf;Tftftf];
for i = 2:6
    tmp1 = X(2,:).^i;
    tmp2 = X(3,:).^i;
    X = [X; tmp1; tmp2];
end
end
