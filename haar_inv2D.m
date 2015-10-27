%=======================================================
% function A = haar_inv2D(C, k)
% - inputs: C, k
%       C : two-dimensional haar coefficients
%       k : number of rounds of averaging and differencing
% - outputs: A
%       A : original two-dimensional matrix
%=======================================================
function A = haar_inv2D(C, k)

if nargin < 2
    k = log2(size(A, 1));
end

B = [];
for i=1:size(C, 1)
    B = [B, haar_inv(C(1:end, i)', k)'];
end

A = [];
for i=1:size(C, 1)
    A = [A; haar_inv(B(i, 1:end), k)];
end

return;
