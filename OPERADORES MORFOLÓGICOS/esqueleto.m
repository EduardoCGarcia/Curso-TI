imagen = imread('LETRAS2.jpg');
%imagen = imread('Letras.jpg');
figure, imshow(imagen), title('Imagen Original');   %Mostrar imagen original
pause;

bin = im2bw(imagen,0.5);
figure, imshow(bin), title('Imagen Binaria');       %Mostrar imagen binaria
pause;

SE = strel('square',5);    
imero = imerode(bin,SE);
imeroneg= ~imero;
figure, imshow(imeroneg), title('Imagen Erocionada Negada'); 
pause;

esq = bwskel(imeroneg);
figure, imshow(esq), title('Esqueleto');
pause;

puntos = bwmorph(esq,'endpoints');
figure, imshow(puntos), title('Puntos finales de la imagen'); 
pause;

SE1 = strel('square',3);
puntos = imdilate(puntos,SE);
figure, imshow(puntos),title('Puntos finales dilatados')
pause;

squel = esq - puntos*20;
figure, imshow(squel),title('Resta')
pause;

SE = strel('square',5);
esqdil = imdilate(esq,SE);
esq = imerode(esqdil,SE);
pause;

esq = bwskel(imeroneg);
esq1 = bwmorph(esq,'endpoints');
SE = strel('square',12);
esq1 = imdilate(esq1,SE);
esq = esq - esq1*20;
figure, imshow(esq), title('Esqueleto222222222');
pause;
SE = strel('square',5);
esqdil = imdilate(esq,SE);
esq = imerode(esqdil,SE);

               			

figure, imshow(imero), title('Imagen Erocionada'); 
figure, imshow(imeroneg), title('Imagen Negada'); 
figure, imshow(esq), title('Esqueleto');
figure, imshow(esqdil), title('Esqueleto Dilatado');
figure, imshow(esq), title('Esqueleto Final');

