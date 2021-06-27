

%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        % 
% PARTE 1: ENTRENAMIENTO %
%                        % 
%%%%%%%%%%%%%%%%%%%%%%%%%%
warning off
close all

disp('Parte 1: Entrenamiento (presione enter)');
pause

% Lectura de la imagen de entrenamiento
I = imread('trainTY.jpg');
figure(1)
imshow(I,[]);

% Segmentacion
J =not(I>192); 
J = bwareaopen(J,5,4); % remueve regiones muy pequenas (menores a 5 píxeles y conectividad 4 conexa)
[L,n] = bwlabel(J,4);
figure(2)
imshow(L,[]);

% Extraccion de Caracteristicas
stats = regionprops(L,'all');
TY = zeros(n,1);
for i = 1:n
    disp(sprintf('%3d) EjeMayor=%6.2f EjeMenor = %6.2fd Area =%5d',i,stats(i).MajorAxisLength,stats(i).MinorAxisLength,stats(i).Area));
    figure(3)
    imshow(L==i)
    TY(i) = input('Ingrese 1 si es Y, 2 si es T (Y=1 T=2)?');
end

% Selección de Caracteristicas (manual)
area  = [stats.Area]';
axis1 = [stats.MajorAxisLength]';
axis0 = [stats.MinorAxisLength]';
axisR = axis0./axis1;

% find ---> Busca número de etiqueta; si es 1 es Y, de otra manera, si es 2
%           corresponde a una T
iY = find(TY==1);
iT = find(TY==2);

% Grafica del espacio de caracteristicas 
figure(4)
clf
plot(axisR(iT),area(iT),'rx')
hold on
plot(axisR(iY),area(iY),'*')
xlabel('Razon de Ejes');
ylabel('area')
legend('T','Y')
axis([0 1 0 5000]);

% Conclusion del espacio de caracteristicas
disp('el área no es una buena caracteristica')
disp('la razón de ejes si es una buena característica')

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
imshow(I,[]);

% Segmentacion
J =not(I>192);
J = bwareaopen(J,5,4); % remueve regiones muy pequenas
[L,n] = bwlabel(J,4);
imshow(L,[]);

% Extraccion de caracteristicas
stats = regionprops(L,'all');
%TY = zeros(n,1);

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
    axR = stats(i).MinorAxisLength/stats(i).MajorAxisLength;
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

% Despliegue de resultados
figure(3)
imshow([Y;ones(30,M);T],[])
title('clasificadas como Y ')
xlabel('clasificadas como T ')

% Evaluacion de desempeno
TrueY = input('Cuántas Y fueron clasificadas correctamente?');
TrueT = input('Cuántas T fueron clasificadas correctamente?');

FalseY = nY-TrueY;
FalseT = nT-TrueT;

% Matriz de confusión
P = [TrueY  FalseY
     FalseT TrueT]
 
d = (TrueY+TrueT)/(nY+nT);     
disp(sprintf('Performance = %5.2f %%',d*100))