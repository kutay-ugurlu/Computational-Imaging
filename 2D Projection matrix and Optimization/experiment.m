%% Adjoint operator experiment 
P = 15;
I = double(imread('cameraman.tif'));
L = size(I,1);
H = randi(10,P);
C = convmtx2(H,L,L);
y_vec = C*I(:);
res = reshape(y_vec,L+P-1,L+P-1);
res = reshape(res((P-1)/2+1:end-((P-1)/2),(P-1)/2+1:end-((P-1)/2)),L,L);
res2 = conv2(I,H,'same');
disp(['RES: ',num2str(isequal(res,res2))])

adjoint_res = reshape(C'*y_vec,L,L);
adjoint_res2 =  conv2(res,flip(flip(H,1),2),'same');
adjoint_res = adjoint_res(0.5*(P-1)+1:end-(0.5*(P-1)),0.5*(P-1)+1:end-(0.5*(P-1)));
adjoint_res2 = adjoint_res2(0.5*(P-1)+1:end-(0.5*(P-1)),0.5*(P-1)+1:end-(0.5*(P-1)));
disp(['ADJOINT RES: ',num2str(isequal(adjoint_res,adjoint_res2))])

subplot(2,2,3)
imagesc(res), colormap gray
subplot(2,2,4)
imagesc(res2)

subplot(2,2,1)
imagesc(adjoint_res), colormap gray
subplot(2,2,2)
imagesc(adjoint_res2)
disp(['NORM: ',num2str(norm(adjoint_res-adjoint_res2)/norm(adjoint_res))])
figure
imagesc(adjoint_res-adjoint_res2), colormap gray

%% Discrete derivative experiment
D1 = [-1 0 1];
% D2 = D1';
R1 = convmtx2(D1,L,L);
% R2 = convmtx2(D2,L,L);
y1_vec = R1*I(:);
y1_img = reshape(y1_vec,L+2,L);
y1_vec_adjoint = R1' * y1_vec;
y1_img_adjoint = reshape(y1_vec_adjoint,L,L);
y1_img_back = conv2(y1_img(2:257,:),flip(D1),'same');
y1_img_back = reshape(y1_img_back,L,L);

disp(['NORM: ',num2str(norm(y1_img_adjoint-y1_img_back)/norm(y1_img_back))])


size_y1_img = size(y1_img,1)/2;
size_y1_img_back = size(y1_img_back,1)/2;

y1_img = y1_img(size_y1_img-L/2+1:size_y1_img+L/2,size_y1_img-L/2:size_y1_img+L/2-1);
y1_img_back = y1_img_back(size_y1_img_back-L/2+1:size_y1_img_back+L/2,size_y1_img_back-L/2+1:size_y1_img_back+L/2);

subplot(1,2,1)
imagesc(y1_img_back), colormap gray;
subplot(1,2,2)
imagesc(y1_img)

disp(['NORM: ',num2str(norm(y1_img-y1_img_back)/norm(y1_img_back))])


% 
% res = conv2(I,D1);
% res2 = conv2(I,D2);
% res = reshape(res((P-1)/2+1:end-((P-1)/2),(P-1)/2+1:end-((P-1)/2)),L,L);
