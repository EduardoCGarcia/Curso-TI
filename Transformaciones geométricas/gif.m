close all
[X,mp] = imread('cameraman.tif');

%figure(1)
%imshow(X,mp)
axis on
%title('imagen original').

[N,M] = size(X);
         
%disp('Presionar Enter...');pause

% Traslacion
Y = zeros(N,M);

i0 = 60;
j0 = 126;

ki = 2;
kj = 3;
k=1;

while 1==1
    th = 90*k;
    for i=1:N
        for j=1:M
           m = [cos(th)*sin(th) k/20 ;-sin(th) cos(th)]*[i-i0 j-j0]'+[i0 j0]' *k/20;
           ip = fix(m(1)+0.5);
           jp = fix(m(2)+0.5);
           if (jp>=1) & (jp<=M) & (ip>=1) & (ip<=N)
               Y(i,j) = X(ip,jp);           
           end
       end
    end
    k=k+1;
    if k>50
        k=1;
        th=30*pi/180;
    end
       
    figure(1)
    imshow(Y,mp)
    axis on
end

figure(2)
imshow(Y,mp)
axis on
           


