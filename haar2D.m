%=======================================================
% function C = haar2D(A, k)
% - inputs: A, k
%       A : two-dimensional matrix 
%       k : number of rounds of averaging and differencing
% - outputs: C
%       C : two-dimensional haar coefficients
%=======================================================
function C = haar2D(A, k)

if nargin < 2
    k = log2(size(A, 1));
end

B = [];
for i=1:size(A, 1)
    B = [B; haar(A(i, 1:end), k)];
end

C = [];
for i=1:size(A, 1)
    C = [C, haar(B(1:end, i), k')'];
end

return;
