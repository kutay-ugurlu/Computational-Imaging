%% Q4 d

close all; clc; clear;
X = mat2gray(double(imread('cameraman.tif')));
H = gauss2d(15,15,0,0,2,2);
D1 = [-1 0 1];
D2 = D1';
H_flipped = flip(flip(H,1),2);
Y = conv2(X,H,'same');
sigma_s = var(Y(:));
sigma_n = sigma_s * 1e-3; 
noise = sigma_n * randn(size(Y));
Y = Y + noise;
b = conv2(Y,H_flipped,'same');
n_iter = 250;
x_0 = randn(size(X));
i = 1;
f1 = figure('units','normalized','outerposition',[0.0823    0.1111    0.7063    0.7963]);
exponents = linspace(-5,-1,25);
for lambda = power(10,exponents)
    estimate = cgconvtik(H, D1, D2, b, x_0, lambda, n_iter);
    X_back = reshape(estimate,size(X));
    subplot(5,5,i)
    imagesc(X_back), colormap gray
    title({['\lambda = ',num2str(lambda)],['Exponent of 10: ',num2str(exponents(i))]})
    i = i+1;
end
sgtitle(['CG Reconstructions for N_{iter} = ',num2str(n_iter)])

%%
X = phantom('Modified Shepp-Logan',256);
D1 = [-1 0 1];
D2 = D1';

theta_step = 180/(size(X,1));
thetas = 0:179;
Y = radon(X);
sigma_s = var(Y(:));
sigma_n = sigma_s * 1e-3; 
noise = sigma_n * randn(size(Y));
Y = Y + noise;
b = iradon(Y,thetas);
b = b(2:end-1,2:end-1);

n_iter = 250;
x_0 = randn(size(X));
i = 1;
f2 = figure('units','normalized','outerposition',[0.1964 0.2250 0.4896 0.6019]);
exponents = linspace(-2,2,20);
for lambda = power(10,exponents)
    tic
    estimate = cgradontik(D1, D2, b, x_0, lambda, n_iter);
    X_back = reshape(estimate,size(X));
    subplot(4,5,i)
    imagesc(X_back), colormap gray
    title({['\lambda = ',num2str(lambda)],['Exponent of 10: ',num2str(exponents(i))]})
    i = i+1;
    toc
end
sgtitle(['CG Reconstructions for N_{iter} = ',num2str(n_iter)])