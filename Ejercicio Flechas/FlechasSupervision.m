function d = FlechasSupervision(I);

% Supervision de Flechas. El usuario debe indicar a que clase pertenece
% cada una de las flechas.
%
% D.Mery, DCC-UC, Marzo 2009


figure(1)
clf
imshow(I)
disp(' ');
disp('Tipos de flecha: 1) unidireccional-curva, 2) bidireccional, 3) unidireccional-recta');
disp(' ');
disp('Supervisión: Diga qué tipo de flecha es cada una... ');
disp(' ');

J = imdilate(not(I),ones(3,3));
[L,n] = bwlabel(J,4);
d = zeros(n,1);
for i=1:n
    R = L==i;
    figure(2)
    imshow(R);
    title('1) unidireccional-curva, 2) bidireccional, 3) unidireccional-recta');
    d(i) = input('que flecha es esta?');
end

