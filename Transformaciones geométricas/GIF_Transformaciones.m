close all; %Cerrar todas las ventanas abiertas
X = imread('cameraman.tif');
[N,M] = size(X);
Y = zeros(N,M);

i0 = 1;
j0 = 1;
contador = 0;
ki = 0.5;
kj = 1;
k=1;
while contador ~= 30
    th=k;
    for i=1:N
        for j=1:M
           m = [cos(th) sin(th);-sin(th) cos(th)]*[i-i0 j-j0]'+[i0 j0]'+[ki*i kj*j]';
           ip = fix(m(1)+0.5);
           jp = fix(m(2)+0.5);
           if (jp>=1) & (jp<=M) & (ip>=1) & (ip<=N)
               Y(i,j) = X(ip,jp);
           end
       end
    end
    figure(1)
    imshow(Y,mp)
    axis on
    title(sprintf('imagen con traslacion en (%d,%d)',i0,j0))
    i0 = i0 + 4;
    j0 = j0 + 4;
    k=k+1;
    if i0==100
        i0 = 0;
        j0 = 0; 
    end

    contador=contador+1;

end
