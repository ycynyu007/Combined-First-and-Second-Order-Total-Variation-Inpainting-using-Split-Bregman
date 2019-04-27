function [uk,u_k,b0,b1_x,b1_y,b2_x,b2_y,b2_xy] = SB_init(u,height,width)
% initialization of all variables for iteration
% uk = u_k = u0, b1 = 1, b2 = 1, b0 = 1

uk = gpuArray(u);
u_k = gpuArray(u);

b0 = gpuArray(ones(height,width)*0.01);

b1_x = gpuArray(ones(height,width)*0.01);
b1_y = gpuArray(ones(height,width)*0.01);


b2_x = gpuArray(ones(height,width)*0.01);
b2_xy = gpuArray(ones(height,width)*0.01);
b2_y = gpuArray(ones(height,width)*0.01);
% b2_yx = ones(height,width);

