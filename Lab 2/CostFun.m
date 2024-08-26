function [J, dJ] = CostFun(X,Y,Theta)
sum_ = 0;
[rows, columns] = size(X);
derivative = zeros(1,rows);

y_sig = sigmoid(Theta'*X);
for k = 1:columns
    sum_ = sum_ + (Y(k)*log(y_sig(k)) + (1-Y(k))*log(1-y_sig(k)));
end
for w = 1:rows
    rows = X(w, :);
    for k = 1:columns
        derivative(w) = derivative(w)+(y_sig(k)-Y(k)) *rows(k);
    end
end

J = -sum_/(columns);
dJ = derivative/columns;
end