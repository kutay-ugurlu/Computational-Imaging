%% Q4 c

addpath("autoArrangeFigures");
close all; clc; clear;
X = mat2gray(double(imread('cameraman.tif')));
H = gauss2d(15,15,0,0,2,2);
D1 = [-1 0 1];
D2 = D1';

Y = conv2(X,H,'same');
sigma_s = var(Y(:));
sigma_n = sigma_s * 1e-3; 
noise = sigma_n * randn(size(Y));
Y = Y + noise;
n_iter = 2000;
x_0 = randn(size(X));
i = 1;
f = figure('units','normalized','outerposition',[0 0 1 1]);
for lambda = power(10,linspace(-2,log10(20),25))
    estimate = cgconvtik(H, D1, D2, Y, x_0, lambda, n_iter);
    X_back = reshape(estimate,size(X));
    subplot(5,5,i)
    imagesc(X_back), colormap gray
    title({['\lambda = ',num2str(lambda)], ['N_{iter} = ',num2str(n_iter)]})
    i = i+1;
end
sgtitle('CG Reconstructions')
