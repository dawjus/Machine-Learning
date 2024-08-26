function [] = PlotBoundry(X,Y,Y_pr)
X1 = unique(X(1,:));
X2 = unique(X(2,:));
Yplot = reshape(Y_pr, length(X2), []);
PlotData(X,Y);
hold on;
contour(X1, X2, Yplot, [0.5 0.5], 'LineColor', 'k', 'LineWidth', 2);
end