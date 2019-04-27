function [v_x,v_y] = u_grad(u,D1,D2)
%%% U_GRAD function outputs the two direction gradient of input U
%%%   D1 D2 sparse difference matrix

v_x = u*D1;

v_y = D2*u;


