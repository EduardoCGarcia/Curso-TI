A = imread('basic_shapes.png');

se=strel('disk',10); 
bw=imopen(A,se); %Open with disk radius 10

subplot(1,5,1), imshow(A); title('Original Image'); 
subplot(1,5,2), imshow(bw); title('Opening - disk radius=10');      %Display opened image

se=strel('square',25); 
bw=imopen(A,se); %open with square side 25
subplot(1,5,3), imshow(bw); title('Opening - square side=25');      %Display opened image

B = imread('circles.png');

subplot(1,5,4), imshow(B); title('Imagen B');

se = strel('disk',10);

closeBW = imclose(B, se);

subplot(1,5,5), imshow(closeBW); title('Imagen B Close');


