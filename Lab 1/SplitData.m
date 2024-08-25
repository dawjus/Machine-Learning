function [Xtr,Ytr,Xval,Yval,Xte,Yte] = SplitData(X, Y , ratio)

[~,column] = size(X);
index = randperm(column);
X = X(:, index);
Y = Y(:, index);
size_tr = round(ratio(1)*column);
size_val = round(ratio(2)*column);

Xtr = X(:, 1:size_tr);
Ytr = Y(:, 1:size_tr);
Xval = X(:, size_tr+1:size_tr+size_val);
Yval = Y(:, size_tr+1:size_tr+size_val);
Xte = X(:, size_val + size_tr +1: end);
Yte = Y(:, size_val + size_tr +1: end);
end
