% Filtro pasa alta para el realce de bordes

im = imread('cameraman.tif');


h = firpm(16,[0 0.1 0.3 1],[0 0 1 1]); % Filtro equiripple paso alto
h = ftrans2(h); % Convierte en filtro 2D
imf = filter2(h,im); % Filtrar la imagen



figure()
subplot(1,3,1)
imshow(im), title('Imagen original')

subplot(1,3,2)
imshow(imf*5), title('Bordes')

subplot(1,3,3)
imshow(im+imf*5), title('Imagen con realce')
