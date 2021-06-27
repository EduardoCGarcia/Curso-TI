clear all
close all

Im=imread('HERRAMIENTAS.jpg');
subplot(1,4,1),imshow(Im);title('Original')

Im_bin = im2bw(Im,0.5);
subplot(1,4,2),imshow(Im_bin);title('Binaria')


SE = strel('rectangle',[3 2]);
%text_erode=imerode(text_bin,SE);
%figure,imshow(text_erode)

Im_dilate = imdilate(Im_bin,SE);
Im_dilate = imdilate(Im_dilate,SE);
Im_dilate = imerode(Im_dilate,SE);

subplot(1,4,3),imshow(Im_dilate);title('Dilatada')
Im_fin = not(Im_dilate);
subplot(1,4,4),imshow(Im_fin);;title('Dilatada Negada')

Im_label = bwlabel(Im_dilate,8);
Num_H = max(max(Im_label));
Num_H
