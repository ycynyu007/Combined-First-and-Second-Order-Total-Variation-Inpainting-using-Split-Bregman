function [b0,b1_x,b1_y,b2_x,b2_y,b2_xy] = b_updata(u_k,v_x,v_y,w_x,w_y,w_xy,b0,b1_x,b1_y,b2_x,b2_y,b2_xy)

b0 = b0 + u_k -uk;

[vk_x,vk_y] = u_grad(u_k,Dx,Dy);

[wk_x,wk_y] = u_grad2(u_k,Dxx,Dyy);
wk_xy = Dxy(u_k);

b1_x = b1_x + vk_x - v_x;
b1_y = b1_y + vk_y - v_y;

b2_x = b2_x + wk_x - w_x;
b2_y = b2_y + wk_y - w_y;
b2_xy = b2_xy + wk_xy - w_xy;

