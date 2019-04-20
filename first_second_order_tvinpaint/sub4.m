function [w_xx,w_yy,w_xy] = sub4(wk_x,wk_y,wk_xy,b2_x,b2_y,b2_xy,beta,l2)

t1 = b2_x + wk_x;
t2 = b2_y + wk_y;
t34 = b2_xy + wk_xy;

t = abs(t1.^2 + t2.^2 + 2 * t34.^2);
const = beta/l2;

t_logic = t - const;
t_logic(t_logic < 0) = 0;

w_xx = t_logic .* (t1./t);
w_yy = t_logic .* (t2./t);
w_xy = t_logic .* (t34./t);

w_xx(isnan(w_xx)) = 0;
w_yy(isnan(w_yy)) = 0;
w_xy(isnan(w_xy)) = 0;


