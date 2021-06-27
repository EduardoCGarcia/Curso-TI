close all
clear all;

I = imread('numeros_2.jpg');

R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);



Im_gray = im2gray(R);
%figure; imshow(Im_gray); title('ESCALA DE GRISES');

Im_m = medfilt2(Im_gray,[6 6]); 
Im_m = Im_m - 20;
figure; imshow(Im_m); title('FILTRO MEDIA');

bw = ~im2bw(Im_m,0.1);
figure; imshow(bw); title('IMAGEN BINARIA')

se = strel('rectangle',[5 4]);
 
closeBW = imclose(bw, se);
figure; imshow(closeBW); title('Correction')

se = strel('rectangle',[7 3]);
imerode1 = imdilate(closeBW,se); 

figure; imshow(imerode1); title('Correction2')

se = strel('square',5);
imerode1 = imerode(imerode1,se); 
figure; imshow(imerode1); title('Correction2')

[L, NUM] = bwlabel(imerode1,8);


ocrResults = ocr(imerode1,'CaracterSet','0123456789.');
recognizedText = ocrResults.Text;


fid = fopen('text.txt', 'wt');

fprintf(fid,'%s\n',recognizedText);

fclose(fid); 

winopen('text.txt')
 







