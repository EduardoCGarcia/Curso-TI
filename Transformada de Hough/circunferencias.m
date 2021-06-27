%PASO 1
rgb = imread('coloredChips.png');
figure; imshow(rgb);
disp('Fin del paso 1'),pause;

%Paso 2: Determina rango de radios para búsqueda de circunferencias
d = imdistline;
pause;
delete(d);
disp('Fin del paso 2'),pause;

%Paso 3: Primer intento para localizar circunferencias o circulos
gray_image = rgb2gray(rgb);
[centers, radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark') ;

disp('Fin del paso 3'),pause;
%Paso 4: Incremente la Sensitividad
[centers, radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark', ...
    'Sensitivity',0.9);
disp('Fin del paso 4'),pause;
%Paso 5: Dibuja los circulos en la imagen
h = viscircles(centers,radii);
disp('Fin del paso 5'),pause;


%Paso 6: Emplea otro metodo (Two-stage) para localizar circunferencias
[centers, radii] = imfindcircles(rgb,[20 25],'ObjectPolarity','dark', ...
    'Sensitivity',0.92);

length(centers);
delete(h);  % Elimina circulos dibujados previamente
h = viscircles(centers,radii);

[centers, radii] = imfindcircles(rgb,[20 25], 'ObjectPolarity','dark', ...
          'Sensitivity',0.92,'Method','twostage');

delete(h);

h = viscircles(centers,radii);
disp('Fin del paso 6'),pause;

%Paso 7: hay circunferencias perdidas??
[centersBright, radiiBright] = imfindcircles(rgb,[20 25],'ObjectPolarity', ...
    'bright','Sensitivity',0.92);



hBright = viscircles(centersBright, radiiBright,'EdgeColor','b');
[centersBright, radiiBright, metricBright] = imfindcircles(rgb,[20 25], ...
    'ObjectPolarity','bright','Sensitivity',0.92,'EdgeThreshold',0.1);

delete(hBright);

hBright = viscircles(centersBright, radiiBright,'EdgeColor','b');
figure(5); h = viscircles(centers,radii);
disp('Fin del paso 7'),pause;