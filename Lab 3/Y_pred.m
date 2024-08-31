function [Y] = Y_pred(Y, minval, maxval)
[~, columns] = size(Y);

for k = 1:columns
    if (Y(k) >=minval && Y(k) <= maxval)       
        Y(k) = 0;
    else
        Y(k) = 1;
    end
end