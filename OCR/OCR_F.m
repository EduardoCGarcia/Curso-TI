I = imread('minombre.bmp');

ocrResults = ocr(I);
recognizedText = ocrResults.Text;

figure; imshow(I); title('Imagen original')
pause;

text(600, 150, recognizedText, 'BackgroundColor', [1 1 1]);
fid = fopen('text.txt', 'wt');
fprintf(fid,'%s\n',recognizedText);
fclose(fid); 
winopen('text.txt')

% Despliega una de las palabras reconocidas
word = ocrResults.Words{2};
% Localización de la palabra en I
%wordBBox = results.WordBoundingBoxes(2,:)