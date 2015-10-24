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
