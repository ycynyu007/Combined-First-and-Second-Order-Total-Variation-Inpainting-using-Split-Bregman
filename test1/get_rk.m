function rk = get_rk(uk,v_x,v_y,w_x,w_xy,w_y,b0,b1_x,b1_y,b2_x,b2_y,...
                     b2_xy,l0,l1,l2,D_x,D_y,Dxx,Dyy)
% get_rk function compute the right hand of equation (18) in the paper.

rk = l0 * (uk - b0) + l1 * ((b1_x-v_x)*D_x + D_y*(b1_y-v_y)) - l2*...
    ((b2_x-w_x) * Dxx + Dyy * (b2_y-w_y) + 2 * D_y*(b2_xy - w_xy)*D_x);