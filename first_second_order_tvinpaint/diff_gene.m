function [Dx,Dy,Dxx,Dyy,D_x,D_y] = diff_gene(height,width)
% This function generates first and second order differential operators


ax = [-1;zeros(width-2,1);1];
bx = [-1,1,zeros(1,width-2)];

Dx = gpuArray(sparse(toeplitz(ax,bx)'));                                   % generate Toeplitz matrix(diagonal constant)

axx = [-2;1;zeros(width-3,1);1];
bxx = [-2,1,zeros(1,width-3),1];

Dxx = gpuArray(sparse(toeplitz(axx,bxx)'));                                % since most elements are 0, convert the operator into sparse matrix to save space and
                                                                           % speed up computation
ay = [-1;zeros(height-2,1);1];
by = [-1,1,zeros(1,height-2)];

Dy = gpuArray(sparse(toeplitz(ay,by)));

ayy = [-2;1;zeros(height-3,1);1];
byy = [-2,1,zeros(1,height-3),1];
Dyy = gpuArray(sparse(toeplitz(ayy,byy)));

a_x = [1;-1;zeros(width-2,1)];
b_x = [1,zeros(1,width-2),-1];

D_x = gpuArray(sparse(toeplitz(a_x,b_x)'));

a_y = [1;-1;zeros(height-2,1)];
b_y = [1,zeros(1,height-2),-1];

D_y = gpuArray(sparse(toeplitz(a_y,b_y)));
