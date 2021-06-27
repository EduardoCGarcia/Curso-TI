function [imagen] = process(imGray)
%En esta funcion procesamos la imagen en recibida en escala de grices
%para finalmente obtener la region del pequeño Indiana Jones.

[~, threshold] = edge(imGray, 'canny');
fudgeFactor = 2.3;
imbin = edge(imGray,'canny', threshold * fudgeFactor);

%Limpiamos los pixeles que se encuentren aislados en la imagen.
%Aplicamos la operacion morfologica clean,
% BW2 = bwmorph (BW, operación, n) aplica la operación n veces. 
% n puede ser Inf, en cuyo caso la operación se repite hasta que 
% la imagen ya no cambia.
bws = bwmorph(imbin,'clean',Inf);

se = strel('disk',4);
imagendilate = imdilate(bws,se);  

% BW2 = imfill (BW, 'holes') llena los agujeros en la imagen binaria de 
% entrada BW. En esta sintaxis, un agujero es un conjunto de píxeles de 
% fondo que no se pueden alcanzar rellenando el fondo desde el borde de la 
% imagen.
imgnoholes = imfill(imagendilate, 'holes');

% J = imclearborder(I,conn) specifies the pixel connectivity, conn.
imnoborder = imclearborder(imgnoholes, 8);

%Por ultimo, eliminamos de la imagen, las regiones que tengan menos de
%5000 pixeles, con esto hacemos que desaparezcan regiones que no se
%pudieron eliminar al aplicar el imclearborder, y que se pueden
%BW2 = bwareaopen (BW, P) elimina todos los componentes conectados 
% (objetos) que tienen menos de P píxeles de la imagen binaria BW, 
% produciendo otra imagen binaria, BW2. Esta operación se conoce como 
% apertura de área.
imagen = bwareaopen(imnoborder, 5000);

end

