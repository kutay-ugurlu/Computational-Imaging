%% Q1
% The proposed method created a narrower main lobe in the frequency domain.
close all; clear; clc;
s = 512; ks = 40;
A = zeros(s,s);
A(0.5*s-5*ks:0.5*s+5*ks,0.5*s-5*ks:0.5*s+5*ks) = 1;
[X,Y] = meshgrid(1:s,1:s);
[fft_X,fft_Y] = meshgrid(-s/2+1:s/2,-s/2+1:s/2);
f = figure
subplot(1,2,1)
surf(fft_X,fft_Y,A,'EdgeColor','interp'), colormap jet
% xlim([-s/2+1,s/2])
% ylim([-s/2+1,s/2])
h = subplot(1,2,2);
fft_mag = abs(fftshift(fft2(A)));
surf(fft_X,fft_Y,fft_mag,fft_mag,'EdgeColor','interp'), colormap jet
% xlim([1,s])
% ylim([1,s])
c = colorbar(h,'Position',[0.93 0.11 0.01 0.7]); 
sgtitle('Rectangular Area Fourier Transform')
figure
plot(fft_mag(s/2,:))
title('Center section of Fourier Transform')
A = zeros(s,s);
A(0.5*s-5*ks:0.5*s+5*ks,0.5*s-ks:0.5*s+ks) = 1;
A(0.5*s-ks:0.5*s+ks,0.5*s-5*ks:0.5*s+5*ks) = 1;
[X,Y] = meshgrid(1:s,1:s);
f = figure
subplot(1,2,1)
surf(X,Y,A,'EdgeColor','interp'), colormap jet
xlim([1,s])
ylim([1,s])
h = subplot(1,2,2);
fft_mag = abs(fftshift(fft2(A)));
targetSize = [256 256];
surf(fft_X,fft_Y,fft_mag,fft_mag,'EdgeColor','interp'), colormap jet
% xlim([1,s])
% ylim([1,s])
c = colorbar(h,'Position',[0.93 0.11 0.01 0.7]); 
sgtitle('Cross shaped area and truncated Fourier Transform')
figure
plot(fft_mag(s/2,:))
title('Center section of Fourier Transform')

%% Chinese Hat 
[X,Y] = meshgrid(-3:0.01:3,-3:0.01:3);
f = figure
D = (X.^2+Y.^2);
A = zeros(size(D));
A(D<=1) = 0.5*(acos(sqrt(D(D<=1))) - sqrt(D(D<=1)).*sqrt(1-D(D<=1)));
surf(X,Y,A,'EdgeColor','none'), colormap jet
title('Chinese Hat \texttt{chat}','Interpreter','latex')

