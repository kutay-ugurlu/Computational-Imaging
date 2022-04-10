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
A(D<=1) = 0.5*(acos(sqrt(D(D<=1))) - sqrt(D(D<=1)).*sqrt(1-D(D<=1)));
surf(X,Y,A,'EdgeColor','none'), colormap jet
title('Chinese Hat \texttt{chat}','Interpreter','latex')

%% 
% v1 = [1/4 1/6];
% v2 = [-1/4 1/6];
v1 = [0.5 sqrt(3)/6];
v2 = [0 1/sqrt(3)];
container = [];
upper = 1;
lower = 0;
grid_length = 6;
for i = -grid_length:grid_length
    for j = -grid_length:grid_length
        vec = round(i*v1 + j*v2,3);
        container = [container; vec];
        if lower<=vec(1) && vec(1)<=upper && lower<=vec(2) && vec(2)<=upper
            scatter(vec(1),vec(2),'red')
        elseif lower<=vec(1) && vec(1)<=upper && lower+1<=vec(2) && vec(2)<=upper+1
            scatter(vec(1),vec(2),'blue')
        elseif lower+1<=vec(1) && vec(1)<=upper+1 && lower<=vec(2) && vec(2)<=upper
            scatter(vec(1),vec(2),'green')
        else
            scatter(vec(1),vec(2),'black')
        end
        hold on 
    end
    rectangle('Position',[lower,lower,1,1])
    hold on 
    rectangle('Position',[lower,lower+1,1,1])
    hold on 
    rectangle('Position',[lower+1,lower,1,1])
    grid on 
end

container1 = container(lower<=container(:,1) & container(:,1)<=upper & lower<=container(:,2) & container(:,2)<=upper,:);
samples_per_sq_meter = size(container1,1);
container2 = container(lower<=container(:,1) & container(:,1)<=upper & lower+1<=container(:,2) & container(:,2)<=upper+1,:);
samples_per_sq_meter_two = size(container2,1);
container3 = container(lower+1<=container(:,1) & container(:,1)<=upper+1 & lower<=container(:,2) & container(:,2)<=upper,:);
samples_per_sq_meter_three = size(container3,1);

title({['Samples per square meter: \color{red}',num2str(samples_per_sq_meter)], ...
    ['\color{black} Samples per square meter: \color{blue}',num2str(samples_per_sq_meter_two)], ...
    ['\color{black} Samples per square meter: \color{green}',num2str(samples_per_sq_meter_three)]})