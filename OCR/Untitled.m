   I = imread('imagen_1.jpg');
   I = im2bw(I)
   
   SE=strel('rectangle',[7 7]);  
   I = imerode(I,SE);
     I = imerode(~I,SE);
     I=~I;
     
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