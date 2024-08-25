clear workspace;
% Dawid Justyna

[X, Y]= ReadData();
% Przyjęcie hipotezy funkcją:
% Przyjęte cechy w hipotezie Tf^i, tf^i, tf^(1/i), Tf^(1/i)
% gdzie i jest z zakresu od 1 do 30;
% a także kombinacje tf^i *Tf^i gdzie nalezy od 1 do 30.
X = MapFea(X);
[X, mu, sigma] = NormFea(X);
ratio = [0.7, 0, 0.3];
[Xtr, Ytr, Xval, Yval, Xte, Yte]= SplitData(X,Y,ratio);
rows = size(X, 1);
Theta = zeros(1, rows);
[J, dJ]= CostFun(Xtr, Ytr, Theta);
NumDJ = NumGrad(Xtr, Ytr,Theta);
[ThetaOpt, JOpt] = FindTheta(Theta, Xtr, Ytr);

Y_pred = ThetaOpt* X;
[X3,Y] = ReadData();

X1 = unique(X3(1,:));
X2 = unique(X3(2,:));

Yplot = reshape(Y_pred, length(X2), []);
surf(X1,X2,Yplot);

