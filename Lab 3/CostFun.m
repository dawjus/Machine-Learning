function [J, dJ] = CostFun(X,Y,Theta)
sum_ = 0;
[rows, columns] = size(X);
rowsY = size(Y,1);

J = zeros(rowsY,1);
derivative = zeros(rows,rowsY);
y_sig = sigmoid(Theta'*X);
for y_row = 1:rowsY
    sum_ = 0;
    for k = 1:columns
        sum_ = sum_ + (Y(y_row,k)*log(y_sig(k)) + (1-Y(y_row,k))*log(1-y_sig(k)));
    end
    for w = 1:rows
        wiersz = X(w, :);
        for k = 1:columns
            derivative(w, y_row) = derivative(w, y_row)+(y_sig(k)-Y(y_row,k)) * wiersz(k);
        end
    end
    J(y_row) = -sum_/(columns);
end
dJ = derivative./columns;