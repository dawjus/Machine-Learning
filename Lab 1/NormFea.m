function [x, mu , sigma] = NormFea(X)    
x_1 =  X(2:end,:);
mu = mean(x_1,2);
sigma = std(x_1,[], 2);
x_2 = X(1,:);
x = x_1 - mu;
x = x./sigma;
x =[x_2; x];
end
