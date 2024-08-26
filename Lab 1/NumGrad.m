function NumdJ=NumGrad(X,Y,Theta)
epsilon = 0.0001;

[rows, columns] = size(X);
derivative = zeros(1,rows);
sum_minus = zeros(1,rows);
sum_plus = zeros(1,rows);
Y_pred_minus = zeros(1, columns);
Y_pred_plus = zeros(1, columns);
for ro = 1: rows
    theta_plus = Theta;
    theta_minus = Theta;
    theta_plus(ro) = Theta(ro) + epsilon;
    theta_minus(ro) = Theta(ro) - epsilon;
    for k = 1:columns
        kolumna = X(:, k);
        Y_pred_minus(k) = 0;
        Y_pred_plus(k) = 0;
        for w = 1:rows
            element = kolumna(w);
            Y_pred_minus(k) = Y_pred_minus(k)+ element*theta_minus(w);
            Y_pred_plus(k) = Y_pred_plus(k)+ element*theta_plus(w);
        end
        sum_minus(ro) = sum_minus(ro) + (Y_pred_minus(k)-Y(k))*(Y_pred_minus(k)-Y(k));
        sum_plus(ro) = sum_plus(ro) + (Y_pred_plus(k)-Y(k))*(Y_pred_plus(k)-Y(k));
    end
    derivative(ro) = ((sum_plus(ro)/(2*columns)) - (sum_minus(ro)/(2*columns)))/(2*epsilon) ;
end
NumdJ = derivative;
end