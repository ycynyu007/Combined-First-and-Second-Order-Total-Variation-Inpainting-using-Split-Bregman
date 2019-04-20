function [v_x,v_y] = sub3(vk_x,vk_y,b1_x,b1_y,lamda1,alpha)
s1 = b1_x + vk_x;
s2 = b1_y + vk_y;
s = sqrt(s1.^2 + s2.^2);

s_logic = s-alpha/lamda1;

s_logic(s_logic<0) = 0;

v_x = s_logic.*(s1./s);
v_y = s_logic.*(s2./s);
v_x(isnan(v_x)) = 0;
v_y(isnan(v_y)) = 0;