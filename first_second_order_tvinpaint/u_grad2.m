function [w_x,w_y] = u_grad2(u,D1,D2)
%%% U_GRAD2 function outputs the two direction second order gradient of 
%%% input U
%%% D1 D2 sparse difference matrix

w_x = u * D1;
w_y = D2 * u;

