% Ejemplo de Momentos de Hu
%
I = imread('123.bmp');
J = imdilate(not(I),ones(3,3));
figure(1)
clf
imshow(J,[]);
[L,n] = bwlabel(J,4); %Etiquetado 4 conexo


for i=1:n
    R = (L==i); %Recorremos una a una las etiquetas
    figure(2) %Mostramos la región en la que nos encontramos
    imshow(R);
    
    HM = HuMom(R); %Obtenemos los 7 momentos de HU
    
    %Se llego a este if debido a que si analizamos la matriz de los 
    %7 momentos de HU podemos ver que para identificar los 1 de los 2 y de
    %los 3 se debe cumplir esta condición debido a los valores que 
    %están en la tabla
    if HM(:,7) > 0
        texto = 'Es un tres'; %Se da un texto de lo que se quiere que diga el programa
    else
        if HM(:,6) > 0
            texto = 'Es un uno';
        else
            texto = 'Es un dos';
        end
    end
    
    %esta ultima sección del Código sirve para hablar y decir lo que tenga 
    %la variable texto
    pause(0.5);
    NET.addAssembly('System.Speech');
    obj = System.Speech.Synthesis.SpeechSynthesizer;
    obj.Volume = 100;
    Speak(obj, texto);
  
end


