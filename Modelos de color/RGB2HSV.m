%RGB --> HSV
A=imread('IMAGEN.JPG');
cmap = rgb2hsv(A);
d1=cmap(:,:,1);  %H
d2=cmap(:,:,2);  %S
d3=cmap(:,:,3);  %V

subplot(1,5,1);imshow(A);title('Original');
subplot(1,5,2);imshow(cmap);title('HSV');
subplot(1,5,3);imshow(d1);title('H');
subplot(1,5,4);imshow(d2);title('S');
subplot(1,5,5);imshow(d3);title('V');

pause;

rgb_image = hsv2rgb(cmap);
figure; imshow(rgb_image);title('Re RGB');

R = A(:,:,1);
G = A(:,:,2);
B = A(:,:,3);

subplot(1,3,1); imshow(R);title('R');
subplot(1,3,2); imshow(G);title('G');
subplot(1,3,3); imshow(B);title('B');

pause;

image_hsv = rgb2hsv(R);
hue_r = image_hsv(:,:,1);
figure; imshow(image_hsv);

