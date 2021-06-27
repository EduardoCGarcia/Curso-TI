A = imread('circles.png'); %Read in binary image

bw = bwperim(A); %Calculate perimeter

se = strel('disk',5);
imerode1 = imerode(A,se); %Erocionamos la imgen original

bw1 = A - imerode1;  %Obtenemos los perimetros a travez de la erocion

subplot(1,4,1), imshow(A), title('Imagen original');
subplot(1,4,2), imshow(bw),title('perimetros');
subplot(1,4,3), imshow(imerode1),title('Erocion de la original');
subplot(1,4,4), imshow(bw1), title('original - erocionada');                         