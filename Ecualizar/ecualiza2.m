I =imread('tire.tif');
 
J = histeq(I); %Ecualiza la imagen leída anteriormente
 
imshow(I);
 
figure, imshow(J);	
