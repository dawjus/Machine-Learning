function NumdJ=NumGrad(X,Y,Theta)
epsilon = 0.0001;

[rows, columns] = size(X);
poch = zeros(1,rows);
sum_ = zeros(1,rows);
sum2_ = zeros(1,rows);
Y_pred_minus = zeros(1, columns);
Y_pred_plus = zeros(1, columns);
y_sig_plus = zeros(1, columns);
y_sig_minus = zeros(1, columns);
for ro = 1: rows
    theta_plus = Theta;
    theta_minus = Theta;
    theta_plus(ro) = Theta(ro) + epsilon;
    theta_minus(ro) = Theta(ro) - epsilon;
    for k = 1:columns
        col = X(:, k);

        y_sig_minus(k) = sigmoid(theta_minus'*col);
        y_sig_plus(k) = sigmoid(theta_plus'*col);
        
        Y_pred_minus(k) = Y_pred(y_sig_minus(k),0.7,0.8);
        Y_pred_plus(k) = Y_pred(y_sig_plus(k),0.7,0.8);

        sum_(ro) = sum_(ro) + (y_sig_minus(k)-Y(k))*(y_sig_minus(k)-Y(k));
        sum2_(ro) = sum2_(ro) + (y_sig_plus(k)-Y(k))*(y_sig_plus(k)-Y(k));
    end
    [Jplus, ~] = CostFun(X,Y, theta_plus);
    [Jminus, ~] = CostFun(X,Y, theta_minus);
    poch(ro) = (Jplus - Jminus)/(2*epsilon);
end
NumdJ = poch;
end