function c = haar(u, n)

m = length(u);

% assign default if necessary
if nargin < 2
    n = log2(m);
end

% initialization
c = u;

for i=1:n

    % region of interest
    r = ceil(m / 2^(i-1));

    if r==1
        break;
    end

    % align pairs
    x = reshape(c(1:r), 2, r/2);
    y = x; 

    % compute average and half diffs
    x = sum(x, 1) / 2;
    y = - diff(y, 1) / 2;

    % rebuild new c;
    c = [x y c(r+1:end)];

end

return;
