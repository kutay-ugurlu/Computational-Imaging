function res = forward_radon(lambda,D1,D2,p)
D1_flipped = flip(D1);
D2_flipped = flip(D2);
theta_step = 180/size(p,1);
thetas = 0:theta_step:180-theta_step;
Cp = radon(p,thetas);
CtranposeCp = iradon(Cp,thetas);
CtranposeCp = CtranposeCp(2:end-1,2:end-1);
R1 = conv2(conv2(p,D1,'same'),D1_flipped,'same');
R2 = conv2(conv2(p,D2,'same'),D2_flipped,'same');
res = CtranposeCp + lambda*(R1+R2);
res = res(:);
end