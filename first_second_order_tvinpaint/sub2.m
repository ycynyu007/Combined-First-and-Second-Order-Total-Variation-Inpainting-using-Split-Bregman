function u_k = sub2(fd,rk)

s1 = fft2(gpuArray(rk))./fd;
u_k = ifft2(s1);
u_k = real(u_k);