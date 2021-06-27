I=imread('cameraman.tif');

k=ones(3,3)/9;                      % Filtro Pasa Bajas (Media)
g = [1 2 1; 2 4 2; 1 2 1]/16        % Filtro Gaussiano
g2 = fspecial('gaussian',[5 5],2);  %Filtro gaussiano con desv. est = 2

Im_f = imfilter(I,k);
Im_g = imfilter(I,g);
Im_m = medfilt2(I,[3 3]);            % Filtro Mediana
Im_g2 = imfilter(I,g2);

subplot(1,5,1), imshow(I); title('Original');
subplot(1,5,2), imshow(Im_f); title('Pasa Bajas');
subplot(1,5,3), imshow(Im_g); title('Filtro Gaussiano');
subplot(1,5,4), imshow(Im_m); title('Filtro Media');
subplot(1,5,5), imshow(Im_g2); title('Filtro Especial Gaussiano');
