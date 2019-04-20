function fd = get_fd(height,width,l0,l1,l2)

fd = ones(height,width)*l0;

dxx = zeros(height,width);
dxx(1,1) = -2;
dxx(1,2) = 1;
dxx(1,width) = 1;

dyy = zeros(height,width);
dyy(1,1) = -2;
dyy(2,1) = 1;
dyy(height,1) = 1;

d4x = zeros(height,width);
d4x(1,1) = 6;
d4x(1,2) = -4;
d4x(1,3) = 1;
d4x(1,width-1) = 1;
d4x(1,width) = -4;

d4y = zeros(height,width);
d4y(1,1) = 6;
d4y(2,1) = -4;
d4y(3,1) = 1;
d4y(height-1,1) = 1;
d4y(height,1) = -4;

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

fd = fd - l1*(fft2(dxx)+fft2(dyy)) + l2*(fft2(d4x)+fft2(d4y)+fft2(d2x2y));

