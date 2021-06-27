Im_RGB = imread('Transistores.jpg'); 
subplot(1,5,1),imshow(Im_RGB),title('Original');


Im_bin = im2bw(Im_RGB,0.5); %Binariza la imagen 
subplot(1,5,2), imshow(Im_bin),title('Binaria');

Im_bin2 = not(Im_bin); %operaciones morfológicas SIEMPRE con la negación de la imagen binaria 
subplot(1,5,3), imshow(Im_bin2),title('Negacion de la binaria');

SE = strel('square',6); %elemento estructurante
Im_erode = imerode(Im_bin2,SE); %erocion con el elemento estructurante

subplot(1,5,4), imshow(Im_erode),title('Erocionada');

Im_dilate = imdilate(Im_erode,SE);%Dilatacion con el elemtento estructuraten
subplot(1,5,5),imshow(Im_dilate),title('Dilatada');

Im_label = bwlabel(Im_dilate,8); %Etiquetado 8 conexo
n = max(max(Im_label)); %Obtencion del numero de regiones