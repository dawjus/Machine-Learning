function [X] = MapFea(X)
[~,column]=size(X);
tmp = ones(1, column);
Tftf = X(1,:).*X(2,:);
tfTfTf = X(1,:).*X(2,:).*X(2,:);
Tftftf = X(2,:).*X(1,:).*X(1,:);
X = [tmp;X;Tftf; tfTfTf;Tftftf];
for i = 2:30
    tmp1 = X(2,:).^i;
    tmp2 = X(3,:).^i;
    tmp3 = X(3,:).^(1/i);
    tmp4 = X(2,:).^(1/i);
    X = [X; tmp1; tmp2;tmp3; tmp4];
end

for i = 2:30
    tmp1 = X(2,:).^i .*X(3,:).^i;
    X = [X; tmp1];
end
end
