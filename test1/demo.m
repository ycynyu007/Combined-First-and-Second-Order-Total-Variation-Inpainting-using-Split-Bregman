clear all
% demo of combined first and second order total variation using 
% split bregman algorithm for image inpainting.

                                                                           % load mask,image for processing and original image for MSE.
u = double(rgb2gray(imread('lena_in.png')));
ori = double(rgb2gray(imread('lena.tif')));
Mask = double(rgb2gray(imread('lena_mask.png')));
[height,width] = size(u);

lamda = [0.001,0.1,0.01];                                                  % define the constant variable lambda 1/2/3, alpha and beta.
alpha = 0.01;
beta = 0.001;

iter = 4000;                                                               % define the number of iteration times and mask.
non_mask = Mask;
non_mask(Mask == 0) = 1;
non_mask(Mask == 255) = 0;

% u = double(imread('depth0.png'));
% 
% [height,width] = size(u);
% 
% lamda = [0.001,0.1,0.01];                                                  % define the constant variable lambda 1/2/3, alpha and beta.
% alpha = 0.01;
% beta = 0.001;
% 
% iter = 2000;                                                               % define the number of iteration times and mask.
% non_mask = u;
% non_mask(u ~= 255) = 1;
% non_mask(u==255) = 0;

thresh = 3e-4;
tic;
[uk,error,i] = tv12inpaint(u,non_mask,alpha,beta,lamda,iter,thresh);                      % begin the algorithm iteration.
toc;
figure(1)
imshow(uint8(uk));
figure(2)
plot(1:i,error(1,1:i));