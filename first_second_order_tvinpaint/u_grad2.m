function [w_x,w_y] = u_grad2(u,D1,D2)

w_x = u * D1';
w_y = D2 * u;

