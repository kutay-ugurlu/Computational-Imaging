%% Q1 a

I = mat2gray(imread("cameraman.tif"));
I_back = reshape(I(:),size(I));
subplot(1,2,1)
imshow(I)
title('I')
subplot(1,2,2)
imshow(I_back)
title('I_{back}')


%% Q1 b
