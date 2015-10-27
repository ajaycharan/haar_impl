%========================================================
% function c = haar(u, k, start)
% - inputs: u, k, start
%       u : vector to transform
%       k : number of rounds of averaging and differencing
%           if set, ignore start. i.e. haar_inv(c, k)
%           this parameterization begins the transformation
%           up to a point.
%       start : the iteration at which to begin
%           if set, let k=[]. i.e. haar(c, [], start)
%           this parameterization essentially completes
%           the transormation from a given start point
% - outputs: c
%       c : the coefficient vector computed from the
%           haar transform
%
% This function encompasses both the assigned haar
% function and the haar_step function. 
%
%========================================================
function c = haar(u, k, start)

m = length(u);

% assign default if necessary
if nargin == 1
    k = log2(m);
    start = 1;
end

if nargin == 2
    start = 1;
end

if nargin == 3
    k = log2(m);
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
