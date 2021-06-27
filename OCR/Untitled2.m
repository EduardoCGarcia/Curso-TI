close all
clear all;
I = imread('imagen_p1.jpg');


Im = im2gray(I)
figure; imshow(I); title('Eliminacion de ruido');

g2 = fspecial('gaussian',[10 10],10); %Filtro gaussiano con desv. est = 2
I = imfilter(Im,g2);
%I = im2bw(I);
figure; imshow(I); title('Eliminacion de ruido');
pause;


ocrResults = ocr(I);
recognizedText = ocrResults.Text;
figure;
imshow(I);
text(600, 150, recognizedText, 'BackgroundColor', [1 1 1]);
fid = fopen('text.txt', 'wt');
fprintf(fid,'%s\n',recognizedText);
fclose(fid); 
winopen('text.txt')
% Despliega una de las palabras reconocidas
word = ocrResults.Words{2};
% Localización de la palabra en I
%wordBBox = results.WordBoundingBoxes(2,:)