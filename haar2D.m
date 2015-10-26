%=======================================================
% function C = haar2D(A)
% - inputs: A
%       A : two-dimensional matrix 
% - outputs: C
%       C : two-dimensional haar coefficients
%=======================================================
function C = haar2D(A)

B = [];
for i=1:size(A, 1)
    B = [B; haar(A(i, 1:end))];
end

C = [];
for i=1:size(A, 1)
    C = [C, haar(B(1:end, i)')'];
end

return;
