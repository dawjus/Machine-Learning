function [] = PlotBoundry(X,Y,Y_pr)

X1 = unique(X(1,:));
X2 = unique(X(2,:));

Yplot = cell(1,9);
for i = 1:9
Yplot{i} = reshape(Y_pr(i, :), length(X2), []);
end
colors = ['b', 'g', 'r', 'c', 'm', 'y', 'k', 'b', 'g'];
PlotData(X,Y);
hold on;
for i = 1:9
    contour(X1, X2, Yplot{i}, [0.5 0.5], 'LineColor', colors(i), 'LineWidth', 2);
    hold on;
end
hLegend = legend('1', '2', '3', '4', '5', '6', '7', '8', '9');

end