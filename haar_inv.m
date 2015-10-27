%========================================================
% function u = haar_inv(c, k, start)
% - inputs: c, k, start
%       c : vector of haar coefficients
%       k : number of rounds of averaging and differencing
%           if set, ignore start. i.e. haar_inv(c, k)
%           this parameterization begins the reconstruction
%           up to a point.
%       start : the iteration at which to begin
%           if set, let k=[]. i.e. haar_inv(c, [], start)
%           this parameterization essentially completes
%           the reconstruction from a given start point
% - outputs: u
%       u : the original vector which was transformed
%
% This function encompasses both the assigned haar_inv
% function and the haar__inv_step function. 
%
%========================================================
function u = haar_inv(c, k, start)

% length
m = length(c);

% max iterations
n = log2(m);

% assign default if necessary
if nargin == 1
    k = n;
    start = 1;
end

if nargin == 2
    start = 1;
end

if nargin == 3
    k = n;
end

% initialization
u = c;

for i=start:k

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
