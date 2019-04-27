function [w_xx,w_yy,w_xy] = sub4(wk_x,wk_y,wk_xy,b2_x,b2_y,b2_xy,beta,l2)
% The solution to subproblem is also "shrinkage" operation.

t1 = b2_x + wk_x;
t2 = b2_y + wk_y;
t34 = b2_xy + wk_xy;

t1x = abs(t1);
t2x = abs(t2);
t34x = 2*abs(t34);
% t = sqrt(t1.^2 + t2.^2 + 2 * t34.^2);
t = t1x + t2x + t34x;

const = beta/l2;

t_logic = max(t - const,0);
td = max(t,0.01);

w_xx = t_logic .* (t1./td);
w_yy = t_logic .* (t2./td);
w_xy = t_logic .* (t34./td);

