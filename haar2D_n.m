function C = haar2D_n(A)

B = [];
for i=1:size(A, 1)
    B = [B; haar_n(A(i, 1:end))];
end

C = [];
for i=1:size(A, 1)
    C = [C, haar_n(B(1:end, i)')'];
end

return;