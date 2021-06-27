%Eliminar ruido por filtrado adaptativo

RGB = imread('saturn.png');

I = rgb2gray(RGB);

J = imnoise(I,'gaussian',0,0.025); %Agregamos ruidpo gausinao a la imagen

figure; imshow(J);  title('imagen con ruido Gaussiano');

K = wiener2(J,[5 5]);

figure; imshow(K); title('Porción de la imagen con ruido removido con el  Wiener Filter');