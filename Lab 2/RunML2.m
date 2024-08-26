clear workspace;
clear;
% Dawid Justyna

[X, Y ]= ReadData();
% Przyjęcie hipotezy funkcją:
% Przyjęte cechy w hipotezie Tf^i, tf^i 
% gdzie i jest z zakresu od 1 do 6;
% a także kombinacje tf*Tf*Tf, Tf*tf*tf, Tf*tf
X = MapFea(X);
[X, mu, sigma] = NormFea(X);

ratio = [1, 0, 0];
[Xtr,Ytr,Xval,Yval,Xte,Yte]=SplitData(X,Y,ratio);
rows = size(X,1);
Theta = ones(rows,1);

%Model 1
[J1,dJ1]=CostFun(Xtr,Ytr(1,:),Theta);
%Model 2
[J2,dJ2]=CostFun(Xtr,Ytr(2,:),Theta);

%Pochodne numerycne dla modelu 1 i 2
NumDJ1 = NumGrad(Xtr,Ytr(1,:), Theta);
NumDJ2 = NumGrad(Xtr,Ytr(2,:), Theta);

[ThetaOpt1,JOpt1]=FindTheta(Theta,Xtr,Ytr(1,:));
[ThetaOpt2,JOpt2]=FindTheta(Theta,Xtr,Ytr(2,:));

Y_pr = sigmoid(ThetaOpt1'*X);
Y_pr2 = sigmoid(ThetaOpt2'*X);
Y_pr = Y_pred(Y_pr, 0, 0.5);
Y_pr2 = Y_pred(Y_pr2,  0, 0.5);

Yte_pr = sigmoid(ThetaOpt1'*Xte);
Yte_pr2 = sigmoid(ThetaOpt2'*Xte);
Yte_pr = Y_pred(Yte_pr, 0, 0.5);
Yte_pr2 = Y_pred(Yte_pr2,  0, 0.5);



[X_plot,Y] = ReadData();
display("Macierz pomyłek dla modelu 1");
ConfMatrix(Yte(1,:),Yte_pr);

display("Macierz pomyłek dla modelu 2");
ConfMatrix(Yte(2,:),Yte_pr2);

PlotData(X_plot,Y_pr);
PlotData(X_plot,Y_pr2);

PlotBoundry(X_plot, Y(1,:), Y_pr);
PlotBoundry(X_plot, Y(2,:), Y_pr2);
