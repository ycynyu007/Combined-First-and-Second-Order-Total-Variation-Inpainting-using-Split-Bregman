function u_k = sub2(fd,rk)

s1 = fft2(rk)./fd;
u_k = ifft2(s1);