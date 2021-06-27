I = imread('coins.png');
imshow(I);
K = rangefilt(I);
figure
imshow(K)