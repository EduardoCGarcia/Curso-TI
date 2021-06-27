I=imread('cromosomas.tif');

SE=strel('rectangle',[5 5]);  %Se crea un elemento estrucutrante para hacer una dilatacion

F = imdilate(I,SE); %Se dilata la imagen con el elemeto estructurante

figure,imshow(I), title('original');
pause;

figure,imshow(F),title('imagen dilatada')
pause;

R = 256 - (F - I); 

figure,imshow(R), title('Imagen sin el fondo'); 
pause;

BW = im2bw(R);
figure,imshow(BW);
pause;

BW=imdilate(~BW,SE)
figure,imshow(BW);