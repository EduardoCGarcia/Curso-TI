%Paso Abrir la imagen 
A = imread('nm.png');
figure; imshow(A);
 
%Detectar las frutas mas pequeñas
[centers1, radii1] = imfindcircles(A,[10 35],'ObjectPolarity','bright');
 
%viscircles(centers, radii,'EdgeColor','b');
 
%Detección de las regiones grandes y regiones perdidas
hBright = viscircles(centers, radii,'EdgeColor','b');
[centers, radii, metricBright] = imfindcircles(A,[35 90], ...
    'ObjectPolarity','bright','Sensitivity',0.92,'EdgeThreshold',0.1);
 
delete(hBright);
viscircles(centers1, radii1,'EdgeColor','b');
hBright = viscircles(centers, radii,'LineStyle','--');
 
Manzanas = length(centers1);
Naranjas = length(centers);
 
Total_de_Frutas = Manzanas + Naranjas
