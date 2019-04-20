clear all

%%
u = double(rgb2gray(imread('lena_in.png')));
ori = double(rgb2gray(imread('lena.tif')));
Mask = double(rgb2gray(imread('lena_mask.png')));

[height,width] = size(u);

lamda = [0.001,0.01,0.08];

alpha = 0.001;
beta = 0.008;
iter = 40;
non_mask = Mask;
non_mask(Mask==0) = 1;
non_mask(Mask==255) = 0;

thresh = 1e-3;

[uk] = tv12inpaint(u,non_mask,alpha,beta,lamda,iter);