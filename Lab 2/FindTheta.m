function  [ThetaOpt,JOpt]=FindTheta(Theta0,X,Y)
    options = optimset('fminunc');
    
    fun = @(theta) CostFun(X, Y, theta);
    [ThetaOpt, JOpt] = fminunc(fun, Theta0, options);
end