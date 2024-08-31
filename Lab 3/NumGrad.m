function NumdJ=NumGrad(X,Y,Theta)
epsilon = 0.0001;

[rows, columns] = size(X);
rowsY = size(Y,1);

poch = zeros(rows,rowsY);
for y_row = 1:rowsY    
    for ro = 1: rows
        sum_ = zeros(1,rows);
        sum2_ = zeros(1,rows);
        Y_pred_minus = zeros(1, columns);
        Y_pred_plus = zeros(1, columns);
        y_sig_plus = zeros(1, columns);
        y_sig_minus = zeros(1, columns);
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
    
            sum_(ro) = sum_(ro) + (y_sig_minus(k)-Y(y_row, k))*(y_sig_minus(k)-Y(y_row,k));
            sum2_(ro) = sum2_(ro) + (y_sig_plus(k)-Y(y_row,k))*(y_sig_plus(k)-Y(y_row,k));
        end
        [Jplus, ~] = CostFun(X,Y(y_row,:), theta_plus);
        [Jminus, ~] = CostFun(X,Y(y_row,:), theta_minus);
        poch(ro,y_row) = (Jplus - Jminus)/(2*epsilon);
    end
end
NumdJ = poch;
end