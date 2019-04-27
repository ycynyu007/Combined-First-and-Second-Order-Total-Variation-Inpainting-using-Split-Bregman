function [v_x,v_y] = sub3(vk_x,vk_y,b1_x,b1_y,l1,alpha)
% The solution to subproblem 3 is "shrinkage"
% sk(i, j) = (sk1(i, j), sk2(i, j)) =bk1,x(i, j) + Dxu?k+1(i, j), bk1,y(i, j) + Dyu?k+1(i, j)

s1 = b1_x + vk_x;
s2 = b1_y + vk_y;

% s = sqrt(s1.^2 + s2.^2);
s = abs(s1) + abs(s2);

s_logic = max(s-alpha/l1,0);
sd = max(s,0.01);

v_x = s_logic.*(s1./sd);
v_y = s_logic.*(s2./sd);
