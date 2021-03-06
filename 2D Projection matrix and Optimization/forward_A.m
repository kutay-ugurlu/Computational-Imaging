function res = forward_A(H,lambda,D1,D2,p)
H_flipped = flip(flip(H,1),2);
D1_flipped = flip(D1);
D2_flipped = flip(D2);
Cp = conv2(p,H,'same');
CtranposeCp = conv2(Cp,H_flipped,'same');
R1 = conv2(conv2(p,D1,'same'),D1_flipped,'same');
R2 = conv2(conv2(p,D2,'same'),D2_flipped,'same');
res = CtranposeCp + lambda*(R1+R2);
res = res(:);
end