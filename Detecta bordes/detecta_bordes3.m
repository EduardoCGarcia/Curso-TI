I = imread('circuit.tif');
figure, imshow(I);
rotI = imrotate(I,33,'crop');
rotS = imrotate(I,33,'crop');
rotR = imrotate(I,33,'crop');
rotP = imrotate(I,33,'crop');

figure, imshow(rotI);
BW = edge(rotI,'canny');
figure, imshow(rotS);
BW1 = edge(I,'sobel'); 

figure, imshow(rotR);
RB = edge(I,'roberts'); 

figure, imshow(rotP);
PW = edge(I,'prewitt'); 

subplot(1,4,1), imshow(BW1); title ('Canny');

subplot(1,4,2), imshow(BW1); title ('Söbel');

subplot(1,4,3), imshow(RB); title ('Roberts');

subplot(1,4,4), imshow(PW); title ('Prewitt');

