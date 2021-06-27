BW = imread('text.png');
figure; imshow(BW);
BW2 = bwareaopen(BW, 50); %Elimina regiones menores 50 píxeles
figure;imshow(BW2);