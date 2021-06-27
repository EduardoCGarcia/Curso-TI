%Mostramos la imagen original
I = imread('numeros.jpg');
imshow(I);

%Obteniendo imagen en formato de color HSV
cmap = rgb2hsv(I);

d1=cmap(:,:,1);  %H
d2=cmap(:,:,2);  %S
d3=cmap(:,:,3);  %V

%Trabajamos con H (Elección por prueba-error)
I_aux = d1;

%Trabajamos con la imagen para reconocer el texto


%Aplicamos top-hat a la imagen para obtener detalles dado que hay variaciones de iluminación (No sirvio)
%se = strel('disk',30);
%I_aux = imtophat(I_aux,se);

%Mejoramos el contraste de la imagen
I_aux = imadjust(I_aux);

%Binarizamos la imagen
I_aux = im2bw(I_aux, 0.6);% Mejor valor 0.6

g1 = fspecial('gaussian',[5 5],2);
I_aux = imfilter(I_aux,g1);

%Eliminamos pequenias regiones en la imagen
I_aux = bwareaopen(I_aux,30);

%Eliminamos regiones que esten pegadas al borde
I_aux = (imclearborder(I_aux, 4)); %Este elimina los numeros de arriba

%Dilatamos la imagen con elemento rectangular para completar numeros (verticalmente)
I_aux = imdilate(I_aux,strel('rectangle',[20 2]));

%Dilatamos la imagen con elemento cuadrado para completar algunos numeros (horizontalmente)
I_aux = imdilate(I_aux,strel('square',2));

%Mostramos la imagen con la que se reconocio el texto
global I_final;
I_final = I_aux;
imshow (I_final);

%Aplicamos OCR a la imagen final (Identificando solo los caracteres especificados)
ocrResults = ocr(I_final,'CharacterSet','0123456789.');

%Obtenemos el texto reconocido
recognizedText = ocrResults.Text;

%Abrimos un archivo
fid = fopen('text.txt', 'wt');
%Guardamos el texto reconocido en el archivo
fprintf(fid,'%s\n',recognizedText);
%Cerramos el archivo
fclose(fid);
%Abrimos el archivo en el editor default
winopen('text.txt');




