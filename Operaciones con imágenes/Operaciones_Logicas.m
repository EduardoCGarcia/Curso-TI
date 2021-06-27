A=imread('A.jpg');
A=rgb2gray(A);
A=im2bw(A);

B=imread('B.jpg');
B=rgb2gray(B);
B=im2bw(B);

C = A & B;        % AND
D = A | B;        % OR
E = xor(A,B);     % XOR
F = A & ~B;       % A and not(B)


subplot(1,6,1), imshow(A); title('A');
subplot(1,6,2), imshow(B); title('B');
subplot(1,6,3), imshow(C); title('AND');
subplot(1,6,4), imshow(D); title('OR');
subplot(1,6,5), imshow(E); title('XOR');
subplot(1,6,6), imshow(F); title('A AND not(B)');





