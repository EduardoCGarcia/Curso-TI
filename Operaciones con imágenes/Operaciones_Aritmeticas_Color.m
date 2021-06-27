A=imread('C.jpg');

B=imread('D.jpg');

C = A + B;        % Suma
D = A - B;        % Resta
E = immultiply(A,B);     % Multiplicación

subplot(1,5,1), imshow(A); title('A');
subplot(1,5,2), imshow(B); title('B');
subplot(1,5,3), imshow(C); title('Suma');
subplot(1,5,4), imshow(D); title('Resta');
subplot(1,5,5), imshow(E); title('Multiplicacion');
