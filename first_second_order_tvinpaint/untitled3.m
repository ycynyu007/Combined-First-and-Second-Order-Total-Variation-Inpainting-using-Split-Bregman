[a,b,c,d,e] = diff_gene(20,30);

a = full(a);
b = full(b);
c = full(c);
d = full(d);
e =full(e);
%%
clear all
height = 512;
width = 512;
d2x2y = zeros(height,width);
d2x2y(1,1) = 4;
d2x2y(2,1) = -2;
d2x2y(1,2) = -2;
d2x2y(2,2) = 1;
d2x2y(height,1) = -2;
d2x2y(height,2) = 1;
d2x2y(1,width) = -2;
d2x2y(2,width) = 1;
d2x2y(height,width) = 1;

a = fft2(d2x2y);

[x,y] = meshgrid(1:512,1:512);

surf(x,y,abs(a))

c = ifft2(a);