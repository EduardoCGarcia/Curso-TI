RGB=imread('INDY_1.jpg');
RGB=rgb2gray(RGB);
[~, threshold] = edge(RGB, 'canny');
fudgeFactor = 2.3;

imbin = edge(RGB,'canny', threshold * fudgeFactor);

bws = bwmorph(imbin,'clean',Inf);


se = strel('disk',4);


im_dilate = imdilate(bws,se);  


imgnoholes = imfill(im_dilate, 'holes');


imnoborder = imclearborder(imgnoholes, 8);


imagen = bwareaopen(imnoborder, 5000);


imshow(imagen);

[L,n] = bwlabel(imagen,4);  

m = HuMom(L);
imshow(L);








