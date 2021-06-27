%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        % 
% PARTE 1: ENTRENAMIENTO %
%                        % 
%%%%%%%%%%%%%%%%%%%%%%%%%%
warning off
close all
clear all

%disp('Parte 1: Entrenamiento (presione enter)');
%pause

% Lectura de la imagen de entrenamiento
I = imread('testTY1.jpg');
figure(1)
imshow(I)

% Segmentacion
J =not(I>192); 
J = bwareaopen(J,5,4); % remueve regiones muy pequenas (menores a 5 píxeles y conectividad 4 conexa)
[L,n] = bwlabel(J,4);
figure(2)
imshow(L);

% Extraccion de Caracteristicas
stats = regionprops(L,'all');
TY = zeros(n,1);

for i = 1:n
    disp(sprintf('%3d) Exentricidad = %.2f',i,stats(i).Eccentricity));
    figure(3) 
    imshow(L==i)
    TY(i) = input('Ingrese 1 si es Y, 2 si es T (Y=1 T=2)?');
end
area  = [stats.Area]';
E  = [stats.Eccentricity]';
axis1 = [stats.MaxFeretDiameter]';
axis0 = [stats.MinFeretDiameter]';
axisR = axis0./axis1;

% find ---> Busca número de etiqueta; si es 1 es Y, de otra manera, si es 2
%           corresponde a una T
iY = find(TY==1);
iT = find(TY==2);

figure(4)
clf
plot(axisR(iT),area(iT),'rx')
hold on
plot(axisR(iY),area(iY),'*')
xlabel('Razon de Ejes');
ylabel('area')
legend('T','Y')
axis([0 1 0 5000]);

% Clasificador por umbral
% punto medio de los centros de masa

th = (mean(axisR(iY))+mean(axisR(iT)))/2;

plot([th th],[0 5000],'g:')

%%%%%%%%%%%%%%%%%%%
%                 % 
% PARTE 2: PRUEBA %
%                 % 
%%%%%%%%%%%%%%%%%%%

disp('Parte 2: Prueba (presione enter)');
pause
close all

% Lectura de la imagen de test
i = input('imagen de prueba 1 o 2 ?');
if (i==1)
   I = imread('testTY1.jpg');
else
   I = imread('testTY2.jpg');
end

[N,M] = size(I);
figure(1)
imshow(I);

% Segmentacion
J =not(I>192);
J = bwareaopen(J,5,4); % remueve regiones muy pequenas
[L,n] = bwlabel(J,4);
imshow(L);

% Extraccion de caracteristicas
stats = regionprops(L,'all');
%TY = zeros(n,1);

area = [stats.Area]';
E  = [stats.Eccentricity]';
axis1 = [stats.MajorAxisLength]';
axis0 = [stats.MinorAxisLength]';
axisR = axis0./axis1;

% Clasificacion
iT = find(axisR<=th);
iY = find(axisR>th);

nT = length(iT);
nY = length(iY);

T = zeros(N,M);
Y = zeros(N,M);

for i = 1:n
    axR = stats(i).MinFeretDiameter/stats(i).MaxFeretDiameter;
    if (axR>th)
        Y(stats(i).PixelIdxList) = ones(stats(i).Area,1);
        texto = 'Es una i griega';
    else
        T(stats(i).PixelIdxList) = ones(stats(i).Area,1);
        texto = 'es una te';
    end
figure(3)
imshow([Y;ones(30,M);T],[])
pause(0.5)

NET.addAssembly('System.Speech');
obj = System.Speech.Synthesis.SpeechSynthesizer;
obj.Volume = 100;
Speak(obj, texto);

end

