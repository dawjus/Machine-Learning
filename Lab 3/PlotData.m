function PlotData(X, Y)
C = X(1,:);
D = X(2,:);

figure;
newX = C(Y == 1);
newX2 = D(Y == 1);
newX3 = C(Y == 2);
newX4 = D(Y == 2);
newX5 = C(Y == 3);
newX6 = D(Y == 3);
newX7 = C(Y == 4);
newX8 = D(Y == 4);
newX9 = C(Y == 5);
newX10 = D(Y == 5);
newX11 = C(Y == 6);
newX12 = D(Y == 6);
newX13 = C(Y == 7);
newX14 = D(Y == 7);
newX15 = C(Y == 8);
newX16 = D(Y == 8);
newX17 = C(Y == 9);
newX18 = D(Y == 9);
plot(newX,newX2,'b*','MarkerSize',5 ,'LineWidth',1);
hold on
plot(newX3,newX4,'g*','MarkerSize',5 ,'LineWidth',1);
hold on
plot(newX5,newX6,'r*','MarkerSize',5 ,'LineWidth',1);
hold on
plot(newX7,newX8,'c*','MarkerSize',5 ,'LineWidth',1);
hold on
plot(newX9,newX10,'m*','MarkerSize',5 ,'LineWidth',1);
hold on
plot(newX11,newX12,'y*','MarkerSize',5 ,'LineWidth',1);
hold on
plot(newX13,newX14,'k*','MarkerSize',5 ,'LineWidth',1);
hold on
plot(newX15,newX16,'bs','MarkerSize',5 ,'LineWidth',1);
hold on
plot(newX17,newX18,'gs','MarkerSize',5 ,'LineWidth',1);

title('Model ');
legend('1', '2', '3', '4', '5', '6', '7', '8', '9', 'Location', 'NorthOutside', 'Orientation', 'horizontal');
