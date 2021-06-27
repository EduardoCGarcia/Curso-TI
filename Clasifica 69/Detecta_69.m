Imagen = imread('test96.bmp');
Imagen = not(Imagen);

Imagen = imdilate(Imagen, ones(3,3));

%Mostrar imagen original
figure(1);
imshow(Imagen),title('Imagen original');

%Etiquetado de regiones 8 conexa
[L,n] = bwlabel(Imagen, 8);

%Creamos vector para guardar las coordenadas del rectangulo que contiene la region actual
Region = zeros(1,4);

%No identificadas debido al tipo de fuente
%NO = [4 8 12 16 21 26 30 34 39 43 48 53 57 60 65 70];
pause;
for i=1:n
    %i = 4;
    %Region actual
    R = (L == i);
    %Caracteristicas de la region actual
    Cararct = regionprops(R, 'all');
    
    %Obtener las coordenadas del rectangulo que contiene la region actual
    Region(1,:) = [Cararct.BoundingBox];
    X = Region(1,1);
    Y = Region(1,2);
    Ancho = Region(1,3);
    Alto = Region(1,4);
    
    %Recortar la region de la imagen original
    Reg = imcrop(R, [X, Y, Ancho, Alto] );
    %Obtener la mitad superior de la region
    RegUp = imcrop(R, [X, Y, Ancho, Alto/2] );
    %Obtener la mitad inferior de la region
    RegDown = imcrop(R, [X, Y + Alto/2, Ancho, Alto/2]);
    
    figure(1)
    imshow(R),title(i);

    AreaUp = regionprops(RegUp, 'all');
    AreaDown = regionprops(RegDown, 'all');

    if ((AreaDown(1).Area > AreaUp(1).Area) && ((AreaDown(1).MaxFeretAngle < 0) && (AreaUp(1).MaxFeretAngle > 0)))
        texto = 'Es un seis';        
    elseif((AreaDown(1).Area < AreaUp(1).Area) && ((AreaDown(1).MaxFeretAngle < 0) && (AreaUp(1).MaxFeretAngle > 0)))
        texto = 'Es un seis';
    elseif((AreaDown(1).Area > AreaUp(1).Area) && ((AreaDown(1).MaxFeretAngle > 0) && (AreaUp(1).MaxFeretAngle < 0)))
        texto = 'Es un nueve';
    elseif((AreaDown(1).Area < AreaUp(1).Area) && ((AreaDown(1).MaxFeretAngle > 0) && (AreaUp(1).MaxFeretAngle < 0)))
        texto = 'Es un nueve';
    else 
        texto = 'No identificado';
    end

    NET.addAssembly('System.Speech');
    obj = System.Speech.Synthesis.SpeechSynthesizer;
    obj.Volume = 100;
    Speak(obj, texto);

end

