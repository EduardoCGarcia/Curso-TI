A = imread('nm.png');
J = rgb2gray (A);
BW= im2bw(J);
B=BW;

figure, imshow(A);
figure, imshow(B);
Rmin = 20; %30
Rmax = 35; %65

RRmin = 35; %30
RRmax = 75; %65

[centersBright, radiiBright] = imfindcircles(A,[Rmin Rmax],'ObjectPolarity','bright');
[centersDark, radiiDark] = imfindcircles(BW,[RRmin RRmax],'ObjectPolarity','bright');
viscircles(centersBright, radiiBright,'EdgeColor','b');
viscircles(centersDark, radiiDark,'EdgeColor','r');

CB = length(centersBright)
CO = length(centersDark)
suma = CB+CO