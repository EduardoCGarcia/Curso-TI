A=imread('sunandsea.jpg') ;%Read image
imshow(A);

pause;

I=rgb2gray(A);                                              
J = stdfilt(I);  
subplot(1,4,1), imshow(I); subplot(1,4,2),imshow(J,[]);
pause;
J = entropyfilt(I,ones(15));                                
subplot(1,4,3),imshow(J,[]);
pause;
J = rangefilt(I,ones(5));                                  
subplot(1,4,4),imshow(J,[]); 
pause;
E = entropy(I);

