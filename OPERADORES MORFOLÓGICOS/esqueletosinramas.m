clear all;
close all;

imagen = imread('Letras.jpg');
figure, imshow(imagen), title('Imagen Original');   %Mostrar imagen original

bin = im2bw(imagen,0.5);
figure, imshow(bin), title('Imagen Binaria'); 

SE = strel('square',5);    
imero = imerode(bin,SE);
figure, imshow(imero), title('Imagen Erosionada'); 

esq = bwskel(imero);
figure, imshow(esq), title('Esqueleto');

puntos = bwmorph(esq,'endpoints');
SE = strel('square',6);
pun = imdilate(puntos,SE);
figure, imshow(pun), title('Puntos finales de la imagen');

squel = esq - pun;
figure, imshow(squel), title('Resta');





