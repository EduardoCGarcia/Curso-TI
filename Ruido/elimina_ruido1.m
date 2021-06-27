%**********************************************************
%   Eliminar ruido mediante un filtro de promedio y un filtro mediano
%**************************************************************************
I = imread('coins.png'); figure; imshow(I)

J = imnoise(I,'salt & pepper',0.02); figure; imshow(J)

Kaverage = filter2(fspecial('average',3),J); figure; imshow(Kaverage)

Kmedian = medfilt2(J); imshowpair(Kaverage,Kmedian,'montage')