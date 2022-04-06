close all; clear; clc;
s = 256; ks = 10;
A = zeros(s,s);
A(0.5*s-5*ks:0.5*s+5*ks,0.5*s-5*ks:0.5*s+5*ks) = 1;
[X,Y] = meshgrid(1:s,1:s);
f = figure
subplot(1,2,1)
surf(X,Y,A,'EdgeColor','none'), colormap jet
xlim([1,s])
ylim([1,s])
h = subplot(1,2,2);
fft_mag = abs(fftshift(fft2(A)));
surf(X,Y,fft_mag,fft_mag,'EdgeColor','none'), colormap jet
xlim([1,s])
ylim([1,s])
c = colorbar(h,'Position',[0.93 0.11 0.01 0.7]); 
figure
plot(fft_mag(128,:))
%%
s = 256; ks = 10;
A = zeros(s,s);
A(0.5*s-5*ks:0.5*s+5*ks,0.5*s-ks:0.5*s+ks) = 1;
A(0.5*s-ks:0.5*s+ks,0.5*s-5*ks:0.5*s+5*ks) = 1;
[X,Y] = meshgrid(1:s,1:s);
f = figure
subplot(1,2,1)
surf(X,Y,A,'EdgeColor','none'), colormap jet
xlim([1,s])
ylim([1,s])
h = subplot(1,2,2);
fft_mag = abs(fftshift(fft2(A)));
surf(X,Y,fft_mag,fft_mag,'EdgeColor','none'), colormap jet
xlim([1,s])
ylim([1,s])
c = colorbar(h,'Position',[0.93 0.11 0.01 0.7]); 
figure
plot(fft_mag(128,:))

%%

[X,Y] = meshgrid(-3:0.01:3,-3:0.01:3);
s = 256; ks = 10;
f = figure
D = (X.^2+Y.^2);
A = zeros(size(D));
A(D<=4) = 2*acos(0.5*sqrt(D(D<=4))) - sqrt(D(D<=4)).*sqrt(1-0.25*D(D<=4));
surf(X,Y,A,'EdgeColor','none'), colormap jet
title('Chinese Hat \texttt{chat}','Interpreter','latex')
