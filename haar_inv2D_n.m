%=======================================================
% function A = haar_inv2D_n(C)
% - inputs: C
%       C : two-dimensional normalized haar coefficients
% - outputs: A
%       A : original two-dimensional matrix
%=======================================================
function A = haar_inv2D_n(C)

B = [];
for i=1:size(C, 1)
    B = [B, haar_inv_n(C(1:end, i)')'];
end

A = [];
for i=1:size(C, 1)
    A = [A; haar_inv_n(B(i, 1:end))];
end
A = round(A);

return;
