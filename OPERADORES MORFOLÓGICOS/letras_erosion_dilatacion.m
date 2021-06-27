clear all
close all

text=imread('HERRAMIENTAS.jpg');
imshow(text)
text_bin=im2bw(text,0.5);
figure,imshow(text_bin)
SE=strel('rectangle',[3 2]);
%text_erode=imerode(text_bin,SE);
%figure,imshow(text_erode)
text_dilate=imdilate(text_bin,SE);
figure,imshow(text_dilate)
text_fin=not(text_dilate);
figure,imshow(text_fin);

Im_label=bwlabel(text_dilate,8);
n=max(max(Im_label));