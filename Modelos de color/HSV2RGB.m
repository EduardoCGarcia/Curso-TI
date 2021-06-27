%HSV --> RGB
A=imread('flores.JPG');

cmap = hsv2rgb(A);
d1=cmap(:,:,1);  %H
d2=cmap(:,:,2);  %S
d3=cmap(:,:,3);  %V

ssubplot(1,5,1);imshow(A);title('Original');
subplot(1,5,2);imshow(cmap);title('RGB');
subplot(1,5,3);imshow(d1);title('R');
subplot(1,5,4);imshow(d2);title('G');
subplot(1,5,5);imshow(d3);title('B');
