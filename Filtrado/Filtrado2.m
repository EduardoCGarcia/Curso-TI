I=imread('cameraman.tif');
k=ones(3,3)/9; % Filtro Pasa Bajas (Media)
g = [1 2 1; 2 4 2; 1 2 1]/16; % Filtro Gaussiano

Mask1 = [1 1 1; 1 -8 1; 1 1 1]/8;
Mask2 = [0 1 0; 1 -4 1; 0 1 0]/4;
Mask3 = [-1 1 -2; 1 -4 1; -2 1 -2]/3;
Mask4 = [1 1 1; 1 -8 1; 1 1 1]/8;

g2 = fspecial('gaussian',[5 5],2); %Filtro gaussiano con desv. est = 2
mi = min(min(3,3)); %Filtro minimo
ma = max(max(3,3)); %Filtro maximo
Im_f = imfilter(I,k);
Im_g = imfilter(I,g);

Im_g2 = imfilter(I,g2);
Im_d = imfilter(I,mi);
Im_b = imfilter(I,ma);

Im_m = medfilt2(I,[3 3]); % Filtro Mediana

Im_Lap1 = imfilter(I,Mask1);
Im_Lap2 = imfilter(I,Mask2);
Im_Lap3 = imfilter(I,Mask3);
Im_Lap4 = imfilter(I,Mask4);
imshow(I); title('Original')
pause;
%imshow(Im_m); title('Media')
%pause;
imshow(Im_Lap1); title('Laplaciano')
pause;

imshow(Im_Lap2); title('Laplaciano')
pause;
imshow(Im_Lap3); title('Laplaciano')
pause;
imshow(Im_Lap4); title('Laplaciano')
pause;


