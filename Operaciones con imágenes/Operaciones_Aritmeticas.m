A=imread('A.jpg');
A=rgb2gray(A);
A=im2bw(A);

B=imread('B.jpg');
B=rgb2gray(B);
B=im2bw(B);

C = A + B;        % Suma
D = A - B;        % Resta
E = immultiply(A,B);    %Multipicación



subplot(1,5,1), imshow(A); title('A');
subplot(1,5,2), imshow(B); title('B');
subplot(1,5,3), imshow(C); title('Suma');
subplot(1,5,4), imshow(D); title('Resta');
subplot(1,5,5), imshow(E); title('Multiplicación');






