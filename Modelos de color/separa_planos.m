A = imread('flores.jpg');

R = A(:,:,1);
G = A(:,:,2);
B = A(:,:,3);

subplot(1,4,1); imshow(A);title('original');
subplot(1,4,2); imshow(R);title('rojo');
subplot(1,4,3); imshow(G);title('verde');
subplot(1,4,4); imshow(B);title('azul');