%=======================================================
% function A = haar_inv2D(C)
% - inputs: C
%       C : two-dimensional haar coefficients
% - outputs: A
%       A : original two-dimensional matrix
%=======================================================
function A = haar_inv2D(C)

B = [];
for i=1:size(C, 1)
    B = [B, haar_inv(C(1:end, i)')'];
end

A = [];
for i=1:size(C, 1)
    A = [A; haar_inv(B(i, 1:end))];
end

return;
