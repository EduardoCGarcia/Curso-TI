imagen = imread('letras.jpg');
bin=im2bw(imagen,0.5);
SE = strel('square',5);
imero = imerode(bin,SE);

esq=bwmorph(imero,'skel',Inf);

esqdil = imdilate(esq,SE);
esq = imerode(esqdil,SE);

imshow(imagen);
figure,imshow(esq);