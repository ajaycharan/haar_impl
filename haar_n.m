%========================================================
% function c = haar_n(u)
% - input u: 
%       u: vector to transform
% - output c:
%       c: the coefficient vector computed from the
%          normalized haar transform
%========================================================
function c = haar_n(u)

m = length(u);

k = log2(m);

% initialization
c = u;

for i=1:k

    % region of interest
    r = ceil(m / 2^(i-1));

    if r==1
        break;
    end

    % align pairs
    x = reshape(c(1:r), 2, r/2);
    y = x; 

    % compute average and half diffs
    x = sum(x, 1) / sqrt(2);
    y = - diff(y, 1) / sqrt(2);

    % rebuild new c;
    c = [x y c(r+1:end)];

end

return;
