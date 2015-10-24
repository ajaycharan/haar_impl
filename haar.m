function c = haar(u, k, start)

m = length(u);

% assign default if necessary
if nargin < 2
    k = log2(m);
end

if nargin < 3
    start = 1;
end

% initialization
c = u;

for i=start:k

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
