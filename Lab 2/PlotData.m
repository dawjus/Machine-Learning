function PlotData(X, Y)
C = X(1,:);
D = X(2,:);

figure;
newX = C(Y == 1);
newX2 = D(Y == 1);
newX3 = C(Y == 0);
newX4 = D(Y == 0);
plot(newX,newX2,'b*','MarkerSize',5 ,'LineWidth',1);
hold on
plot(newX3,newX4,'r*','MarkerSize',5 ,'LineWidth',1);
title('Model ');