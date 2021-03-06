function estimate = cgconvtik(H, D1, D2, Y, x_0, lambda, n_iter)
size_Y = size(Y);
Y = Y(:); 
Ax_0 = forward_A(H,lambda,D1,D2,x_0);
x_0 = x_0(:);
r = Y - Ax_0;
p = r;
for k = 1:n_iter
    Ap = forward_A(H,lambda,D1,D2,reshape(p,size_Y));
    alpha = (r'*r)/(p'*Ap);
    x_0 = x_0 + alpha*p;
    r_new = r - alpha*Ap;
    beta = (r_new'*r_new)/(r'*r);
    p = r_new + beta*p;
    r = r_new;
end
estimate = x_0;
end

