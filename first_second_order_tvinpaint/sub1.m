function uk = sub1(s1,s2,u,b0,u_k)
% subproblem 1 has a closed form solution: uk+1(i, j) = 2X?\D(i,j)/(¦Ë0+2)+
% u0(i, j) + (¦Ë0+2(1?X?\D(i,j)))/(¦Ë0+2) * (bk0(i, j) + ?uk(i, j)

uk = s1.*u +s2.*(b0+u_k);
            