
clc;
clear all;

k = input('Nombre de archivo:','s'); % Ingresa nombre
im = imread(k);

im1 = rgb2gray(im);
im1 = medfilt2(im1,[3 3]); %Filtro mediana para remover ruidoe%

BW = edge(im1,'sobel'); %Detecta bordes 
[imx,imy] = size(BW);

msk=[0 0 0 0 0;
     0 1 1 1 0;
     0 1 1 1 0;
     0 1 1 1 0;
     0 0 0 0 0;];
 
B = conv2(double(BW),double(msk)); %Reduciendo el número de píxeles conectados
L = bwlabel(B,8);% Detecta regiones

mx = max(max(L))
% Habrá mx componentes conexos.Proporcionar un valor entre 1 y mx para L o
% en un ciclo para poder extraer todos lo componentes
% Para la imagen de la placa del auto,proporcionar 17,18,19,22,27,28 a L para extraer el número completo de la placa.

[r,c] = find(L==17|L==19|L==18|L==22|L==27|L==28);  

%[row,col] = find(___)
%[row,col] = find(X>0 & X<10,3)
%row = 3×1
%     2
%     3
%     4
%col = 3×1
%     1
%     1
%     1
%La primera instancia es X(2,1), que es 8.

rc = [r c];

[sx sy] = size(rc);

n1 = zeros(imx,imy); %Matriz de ceros del tamaño de la imagen binarizada

for i=1:sx
    x1 = rc(i,1);
    y1 = rc(i,2);
    n1(x1,y1) = 255;
end % Almacenando las regiones extraídas en un arreglo

figure,imshow(im);
figure,imshow(im1);
figure,imshow(B);
figure,imshow(n1,[]);