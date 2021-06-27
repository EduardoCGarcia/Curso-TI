I = imread('coins.png');
figure, imshow(I)

%T�cnicas de detecci�n de bordes
BW1 = edge(I,'sobel'); 
RB = edge(I,'roberts'); 
PW = edge(I,'prewitt'); 
BW2 = edge(I,'canny');

figure, imshow(BW1); title ('S�bel');

figure, imshow(RB); title ('Roberts');

figure, imshow(PW); title ('Prewitt');

figure, imshow(BW2);  title ('Canny');
