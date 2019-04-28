function [error,i] = tv12inpaint(u,non_mask,alpha,beta,lamda,iter,thresh)
% purpose£ºusing first and second order total variation to inpaint the
%          missing area of an image based on paper: 
% "Combined First and Second Order Total Variation Inpainting using Split
%  Bregman"
% Konstantinos Papafitsoros, Carola-Bibiane Schonlieb, Bati Sengul

% usage£ºuk = tv12inpaint(u,non_mask,alpha,beta,lamda,iter)

% input£º
%       u: the image waiting for processing
%       non_mask: mask for the missing area where equals to 0 if data is
%       missing and 1 for the rest.
%       alpha/beta/lamda: constant variable used in the minimization
%       equation.
%       iter: number of iteration times

% ouput£º
%       uk: inpainted image
% date£º March 17,2019  
% Chengyun Yang, Tandon School of Engineering, New York University
% Email: cy1231@nyu.edu

global uk 
persistent u_k b0 b1_x b1_y b2_x b2_y b2_xy v_x v_y w_x w_xy w_y
[height,width] = size(u);
u = gpuArray(u);
non_mask = gpuArray(non_mask);

[Dx,Dy,Dxx,Dyy,D_x,D_y] = diff_gene(height,width);                         % first and second order discret differential operator

if isempty(uk)
    [uk,u_k,b0,b1_x,b1_y,b2_x,b2_y,b2_xy] = SB_init(u,height,width);
    [v_x,v_y] = u_grad(u,Dx,Dy);                                               % first order TV of original input  
    [w_x,w_y] = u_grad2(u,Dxx,Dyy);                                            % second order TV of original input
    w_xy = Dy*u*Dx;
end

l0 = lamda(1,1);
l1 = lamda(1,2);
l2 = lamda(1,3);

s1 = 2*non_mask/(l0+2);                                                    % define the constant mask matrix s1 and s2 used in subproblem_1,
s2 = (l0+2*(1-non_mask)) / (l0+2);
fd = get_fd(height,width,l0,l1,l2);

error = gpuArray(zeros(1,iter));

for i = 1:iter
% iterations for split bregman algorithm

% solution to subproblem 1   
    uk_temp = sub1(s1,s2,u,b0,u_k);
    
    l2_norm = (uk-uk_temp).^2;
    error(1,i) = sqrt(mean(l2_norm(:)));
    uk = uk_temp;
    
%     if i > 1 && abs((error(1,i-1)-error(1,i)))/error(1,i-1) < thresh
%         break
%     end

    % solution to subproblem 2    
    rk = get_rk(uk,v_x,v_y,w_x,w_xy,w_y,b0,b1_x,b1_y,b2_x,b2_y,b2_xy,l0,...
                l1,l2,D_x,D_y,Dxx,Dyy);
    u_k = sub2(fd,rk);

    % solution to subproblem 3    
    [vk_x,vk_y] = u_grad(u_k,Dx,Dy);                                       % computer the first and second order TV of the u_k.
    [wk_x,wk_y] = u_grad2(u_k,Dxx,Dyy);
     wk_xy = Dy*u_k*Dx;
    
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

end
