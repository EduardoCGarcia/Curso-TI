I = imread('letras.jpg');
J = rgb2gray(I); % Convierte de RGB a Escala de Gris


%k=ones(3,3)/9;
g2 = fspecial('gaussian',[5 5],3)

Img_Filt = imfilter(J,g2);
BW = im2bw(Img_Filt); % Binariza sin especificar umbral; con umbral BW=im2bw(J, 0.5) por ejemplo
[L, NUM] = bwlabel(BW,4)% L = numero de etiquetas, NUM = Número de regiones conexas empleando conectividad 4-conexo
CC = bwconncomp(BW,4); % Obtiene componentes  con conectividad 8-vecinos;  bwconncomp(BW,4) sería de 4-vecinos
L2 = labelmatrix(CC);  % 
RGB = label2rgb(L2);

 imshow(I); title('Original');
 imshow(RGB); title('RGB');