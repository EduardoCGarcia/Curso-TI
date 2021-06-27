I=imread('cameraman.tif');

k=ones(3,3)/9; % Filtro Pasa Bajas (Media)
g = [1 2 1; 2 4 2; 1 2 1]/16; % Filtro Gaussiano
g2 = fspecial('gaussian',[5 5],2); %Filtro gaussiano con desv. est = 2
mi = min(min(3,3)); %Filtro minimo
ma = max(max(3,3)); %Filtro maximo

Im_f = imfilter(I,k);
Im_g = imfilter(I,g);
Im_m = medfilt2(I,[3 3]); % Filtro Mediana
Im_g2 = imfilter(I,g2);
Im_d = imfilter(I,mi);
Im_b = imfilter(I,ma);

h = firpm(16,[0 0.1 0.3 1],[0 0 1 1]); % Filtro equiripple paso alto
h = ftrans2(h); % Convierte en filtro 2D
imf = filter2(h,im); % Filtrar la imagen

imshow(I); title('Original')
pause;
imshow(Im_f); title('Filtro Pasa Bajas (Media)')
pause;
imshow(Im_g);  title('Filtro Gaussiano)')
pause;
imshow(Im_m); title('Filtro (Media)')
pause;
imshow(Im_g2); title('Filtro gaussiano con desv. est = 2')
pause;
imshow(Im_d); title('Filtro minimo')
pause;
imshow(Im_b); title('Filtro maximo')
pause;
imshow(imf); title('Bordes)')
%imshow(im+imf); title('Imagen mejorada')
%pause;

