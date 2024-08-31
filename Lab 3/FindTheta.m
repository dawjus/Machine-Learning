function  [ThetaOpt,JOpt]=FindTheta(Theta0,X,Y)
    options = optimset('fminunc');
    [y_rows, y_cols] = size(Y);
    x_rows = size(X,1);
    JOpt = zeros(y_rows,1);
    ThetaOpt = zeros(x_rows,y_rows);
    for k  = 1:y_rows
        fun = @(theta) CostFun(X, Y(k,:), theta);
        [ThetaOpt(:,k), JOpt(k)] = fminunc(fun, Theta0, options);
    end
end
