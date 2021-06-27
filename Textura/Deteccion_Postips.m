clear all
close all
%IM=imread('postip_1.jpg') ; %Leer imagen
%IM=imread('tres_postips.jpg') ; %Leer imagen
IM=imread('postip22.jpg') ; %Leer imagen
Im_gray=rgb2gray(IM); %Convertir a escala de grises
BW=im2bw(Im_gray);

Se=strel('square',20);
BW=imerode(BW,Se);

[L,n] = bwlabel(BW);
%IM=regionprops(L,'Area', 'BoundingBox'); %devuelve medidas para el conjunto de propiedades para cada componente
[N,M]=size(BW);
BW2=IM;

for i=1:n
R = L==i;

    for j=1:N
        for k=1:M
            if(R(j,k)==1)
                BW2(j,k,1)=IM(j,k,1);
                BW2(j,k,2)=IM(j,k,2);
                BW2(j,k,3)=IM(j,k,3);
            else
                BW2(j,k,1)=0;
                BW2(j,k,2)=0;
                BW2(j,k,3)=0;
            end
        end
    end

E=entropy(BW2);

    if (E >= 0.920 && E <= 0.9245)
        figure, imshow(BW2), title('Amarillo');
        disp ('Amarillo');
    else
        if (E >=0.9632 && E < 0.9634)
            figure, imshow(BW2), title('Azul');
            disp ('Azul');
        else
            if (E >= 0.9246 && E <= 2.976)  %Al leer las imagenes y calcular su entropia estos son los rangos por color diferentes entre si debido a la cantidad de pixeles de ese tono
                figure, imshow(BW2), title('Crema');
                disp ('Crema');
            end
        end
        
    end
    

end



disp(['En total hay ' num2str(n) ' postips']);