function dxy = Dxy(u)

[height,width] = size(u);
dxy = zeros(height,width);
for i = 1:height
    for j = 1:width
        if i < height && j < width
            dxy(i,j) = u(i, j) - u(i+1, j) - u(i,j+1) + u(i+1,j+1);
        elseif i== height && j<width
            dxy(i,j) = u(i, j) - u(1,j) - u(i,j+1) + u(1,j+1);
        elseif j==width && i < height
            dxy(i,j) = u(i, j) - u(i+1, j) - u(i,1) + u(i+1,1);
        elseif i == height && j == width
            dxy(i,j) = u(i, j) - u(1, j) - u(i,1) + u(1,1);
        end
    end
end
            