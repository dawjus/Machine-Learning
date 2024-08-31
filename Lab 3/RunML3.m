clear workspace;
clear;
% Dawid Justyna

[X, Y]= ReadData();
% Przyjęcie hipotezy funkcją:
% Przyjęte cechy w hipotezie Tf^i, tf^i 
% gdzie i jest z zakresu od 1 do 6;
% a także kombinacje tf*Tf*Tf, Tf*tf*tf, Tf*tf
Y_copy = Y;
Y = Y_to_Y01(Y);
X = MapFea(X);
[X, mu, sigma] = NormFea(X);
ratio = [0.7, 0, 0.3];
[Xtr,Ytr,Xval,Yval,Xte,Yte] = SplitData(X,Y_copy,ratio);
rows = size(X,1);
Theta = ones(rows,1);

Ytr = Y_to_Y01(Ytr);
[J1,dJ1]=CostFun(Xtr,Ytr,Theta);

NumDJ1 = NumGrad(Xtr,Ytr, Theta);

[ThetaOpt1,JOpt1]=FindTheta(Theta,Xtr,Ytr);
Y_pr2 = sigmoid(ThetaOpt1'*X);

[~,Y_pr] = max(sigmoid(ThetaOpt1'*X));

[X_plot,Y] = ReadData();
PlotData(X_plot,Y_pr);
PlotBoundry(X_plot, Y, Y_pr2);

[~,Y_prtest] = max(sigmoid(ThetaOpt1'*Xte));
ConfMatrix(Yte,Y_prtest);
