%Círculos claros y oscuros
A = imread('circulos.png');
B=A;
 
figure; imshow(B);
figure, imshow(A);
 
%Estos radios se hacen a prueba y error para la detección de los círculos 
Rmin = 25; %30
Rmax = 65; %65
 
%Detección de los círculos claros y radios de esos círculos
[centersBright, radiiBright] = imfindcircles(A,[Rmin Rmax],'ObjectPolarity','bright');
%Detección de los círculos oscuros y radios de esos círculos
[centersDark, radiiDark] = imfindcircles(A,[Rmin Rmax],'ObjectPolarity','dark');
 
viscircles(centersBright, radiiBright,'EdgeColor','b');
viscircles(centersDark, radiiDark,'LineStyle','--');
 
CB = length(centersBright); %Numero de centros claros
CN = length(centersDark); %Numero de centros oscuros
 
suma = CB + CN; %umero total de círculos
