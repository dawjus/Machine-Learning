function  [ThetaOpt,JOpt]=FindTheta(Theta0,X,Y)
%FINDTHETA Summary of this function goes here
alpha = 0.001;
for i=1:1000
    grad = NumGrad(X, Y, Theta0);
    Theta0 = Theta0 - alpha*grad;
end
[JOpt, ~] = CostFun(X,Y, Theta0);
ThetaOpt = Theta0;

end