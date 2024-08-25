function [J, dJ] = CostFun(X,Y,Theta)
sum_ = 0;
[rows, columns] = size(X);
derivative = zeros(1,rows);
Y_pred = zeros(1, columns);
for k = 1:columns
    col = X(:, k);
    for w = 1:rows
        element = col(w);
        Y_pred(k) = Y_pred(k)+ element*Theta(w);
    end
    sum_ = sum_ + (Y_pred(k)-Y(k))*(Y_pred(k)-Y(k));
end

for w = 1:rows
    row = X(w, :);
    for k = 1:columns
        derivative(w) = derivative(w)+(Y_pred(k)-Y(k)) *row(k);
    end
end

J = sum_/(2*columns);
dJ = derivative/columns;
end