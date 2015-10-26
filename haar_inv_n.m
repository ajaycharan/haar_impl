%========================================================
% function u = haar_inv_n(c)
% - input c: 
%       c: the coefficient vector computed from the
%          normalized haar transform
% - output u:
%       u: vector to transform
%========================================================
function u = haar_inv_n(c)

% length
m = length(c);

% max iterations
n = log2(m);

% initialization
u = c;

for i=1:n

    % region of interest
    r = min(m, m / 2^(n-i));

    if r > m
        break;
    end

    % align pairs
    x = [u(1 : r/2); u(r/2 + 1 : r)];
    y = x;

    % compute average and half diffs
    x = sum(x, 1) / sqrt(2);
    y = -diff(y) / sqrt(2);

    % interleave results
    u_ = reshape([x; y], 1, r);

    % rebuild new u;
    u = [u_ u(r+1:end)];

end

return;
