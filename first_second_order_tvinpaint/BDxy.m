function bdxy = BDxy(u)

[height,width] = size(u);
bdxy = zeros(height,width);
for i = 1:height
    for j = 1:width
        if i == 1 && j ==1
            bdxy(i,j) = u(i, j) - u(1, width) - u(height,1) + u(height,width);
        elseif i==1 && j>1 && j<=width
            bdxy(i,j) = u(i, j) - u(i,j-1) - u(height,j) + u(height,j-1);
        elseif j==1 && i >1 && i<=height
            bdxy(i,j) = u(i, j) - u(i-1, j) - u(i,width) + u(i-1,width);
        else
            bdxy(i,j) = u(i, j) - u(i, j-1) - u(i-1,j) + u(i-1,j-1);
        end
    end
end
            