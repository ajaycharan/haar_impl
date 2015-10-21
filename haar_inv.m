function u = haar_inv(c, k)

% length
m = length(c);

% max iterations
n = log2(m);

% assign default if necessary
if nargin < 2
    k = n;
end

% initialization
u = c;

for i=1:k

    % region of interest
    r = min(m, m / 2^(n-i));

    if r > m
        break;
    end

    % align pairs
    x = [u(1 : r/2); u(r/2 + 1 : r)];
    y = x;

    % compute average and half diffs
    x = sum(x, 1);
    y = -diff(y);

    % interleave results
    u_ = reshape([x; y], 1, r);

    % rebuild new u;
    u = [u_ u(r+1:end)];

end

return;
