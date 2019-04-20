function [uk] = tv12inpaint(u,non_mask,alpha,beta,lamda,iter)

[height,width] = size(u);

[Dx,Dy,Dxx,Dyy,D_x,D_y] = diff_gene(height,width);

[v_x,v_y] = u_grad(u,Dx,Dy);

[w_x,w_y] = u_grad2(u,Dxx,Dyy);
w_xy = Dxy(u);

l0 = lamda(1,1);
l1 = lamda(1,2);
l2 = lamda(1,3);

[uk,u_k,b0,b1_x,b1_y,b2_x,b2_y,b2_xy] = SB_init(u,height,width);

s1 = 2*non_mask/(l0+2);
s2 = (l0+2*(1-non_mask)) / (l0+2);
%s2 = 2*(1-non_mask);
for i = 1:iter
% solution to subproblem 1   
    uk = sub1(s1,s2,u,b0,u_k);

    % solution to subproblem 2    
    fd = get_fd(height,width,l0,l1,l2);
    rk = get_rk(uk,v_x,v_y,w_x,w_xy,w_y,b0,b1_x,b1_y,b2_x,b2_y,b2_xy,l0,...
                l1,l2,D_x,D_y,Dxx,Dyy);
    u_k = sub2(fd,rk);

    % solution to subproblem 3    
    [vk_x,vk_y] = u_grad(u_k,Dx,Dy);

    [wk_x,wk_y] = u_grad2(u_k,Dxx,Dyy);
     wk_xy = Dxy(u_k);
    
    [v_x,v_y] = sub3(vk_x,vk_y,b1_x,b1_y,l1,alpha);

    % solution to subproblem 4    
    [w_x,w_y,w_xy] = sub4(wk_x,wk_y,wk_xy,b2_x,b2_y,b2_xy,beta,l2);

    % update the b matrixs                                 
    b0 = b0 + u_k -uk;

    b1_x = b1_x + vk_x - v_x;
    b1_y = b1_y + vk_y - v_y;

    b2_x = b2_x + wk_x - w_x;
    b2_y = b2_y + wk_y - w_y;
    b2_xy = b2_xy + wk_xy - w_xy;
    figure(1)
    imshow(uint8(real(uk)))
end
