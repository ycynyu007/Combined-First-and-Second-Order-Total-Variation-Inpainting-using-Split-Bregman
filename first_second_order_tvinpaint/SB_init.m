function [uk,u_k,b0,b1_x,b1_y,b2_x,b2_y,b2_xy] = SB_init(u,height,width)

uk = u;
u_k = u;

% v_x = 
% v_y = 
% 
% w_xx = 
% w_yy = 
% w_xy = 
% w_yx = 

b0 = ones(height,width)*0.01;

b1_x = ones(height,width)*0.01;
b1_y = ones(height,width)*0.01;


b2_x = ones(height,width)*0.01;
b2_xy = ones(height,width)*0.01;
b2_y = ones(height,width)*0.01;
% b2_yx = ones(height,width);

