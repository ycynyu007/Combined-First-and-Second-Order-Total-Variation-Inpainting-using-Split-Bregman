function [Dx,Dy,Dxx,Dyy,D_x,D_y] = diff_gene(height,width)

ax = [-1;zeros(width-2,1);1];
bx = [-1,1,zeros(1,width-2)];

Dx = sparse(toeplitz(ax,bx));

axx = [-2;1;zeros(width-3,1);1];
bxx = [-2,1,zeros(1,width-3),1];

Dxx = sparse(toeplitz(axx,bxx));

ay = [-1;zeros(height-2,1);1];
by = [-1,1,zeros(1,height-2)];

Dy = sparse(toeplitz(ay,by));

ayy = [-2;1;zeros(height-3,1);1];
byy = [-2,1,zeros(1,height-3),1];
Dyy = sparse(toeplitz(ayy,byy));

a_x = [1;-1;zeros(width-2,1)];
b_x = [1,zeros(1,width-2),-1];

D_x = sparse(toeplitz(a_x,b_x));

a_y = [1;-1;zeros(height-2,1)];
b_y = [1,zeros(1,height-2),-1];

D_y = sparse(toeplitz(a_y,b_y));
