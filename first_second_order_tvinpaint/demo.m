clear all
profile off
profile on
% demo of combined first and second order total variation using 
% split bregman algorithm for image inpainting.

                                                                           % load mask,image for processing and original image for MSE.
% u = double(rgb2gray(imread('lena_in.png')));
% ori = double(rgb2gray(imread('lena.tif')));
% Mask = double(rgb2gray(imread('lena_mask.png')));

u = double(imread('depth0.png'));

[height,width] = size(u);

lamda = [0.001,0.1,0.01];                                                  % define the constant variable lambda 1/2/3, alpha and beta.
alpha = 0.01;
beta = 0.001;

iter = 2000;                                                               % define the number of iteration times and mask.
non_mask = u;
non_mask(u ~= 255) = 1;
non_mask(u==255) = 0;

thresh = 1e-3;
tic;
[uk] = tv12inpaint(u,non_mask,alpha,beta,lamda,iter);                      % begin the algorithm iteration.
toc;
imshow(uint8(uk));