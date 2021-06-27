I = imread('letras.jpg'); %Permite leer la imagen
subplot(1,5,1),imshow(I); title('Original'); %Muestra la imagen leída
pause; %Pausa la ejecución del programa 
 
whos I %información básica de la imagen
 
K = imfinfo('letras.jpg'); %Toda la información de la imagen
image_bytes = K.Width*K.Height*K.BitDepth/8; %Obtiene el peso en bytes de la imagen
compressed_bytes = K.FileSize;
compression_ratio = image_bytes/compressed_bytes
 
 
J = rgb2gray(I); % Convierte de RGB a Escala de Gris
subplot(1,5,2),imshow(J); title('Escala de grises');
pause;
 
figure(2);imhist(J); %Obtiene el Histograma
pause;
 
BW = im2bw(J); % Binarizar sin especificar umbral; con umbral BW=im2bw(J, 0.5) por ejemplo
subplot(1,5,3),imshow(BW);title('Binaria');
pause;
 
BW2 = ~(BW);  % Negación de la imagen, puede emplearse también BW2 = not(BW)
subplot(1,5,4),imshow(BW2);title('Binaria negada');
pause;
 
[L, NUM] = bwlabel(BW,4)
% L = contiene las etiquetas 
%NUM = Número de regiones conexas empleando conectividad 4-conexo
 
CC = bwconncomp(BW); 
% Obtiene componentes con conectividad 8-vecinos;  
%bwconncomp(BW,4) sería de 4-vecinos
L2 = labelmatrix(CC);   
RGB = label2rgb(L2); %Pone un color a cada etiqueta
pause;
 subplot(1,5,5),imshow(RGB);title('Etiquetado con colores');

