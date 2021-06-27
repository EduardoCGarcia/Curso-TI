% Ejemplo de Momentos de Hu
% 
I = imread('123.bmp');
J = imdilate(not(I),ones(3,3));
figure(1)
clf
imshow(J,[]);
[L,n] = bwlabel(J,4);
Z = zeros(n,8);
for i=1:n
    R = L==i;
    figure(2)
    imshow(R);
    k = input('qué número es este?');
    HM = HuMom(R);
    Z(i,:) = [HM k];
    
end
k1 = find(Z(:,8)==1);
k2 = find(Z(:,8)==2);
k3 = find(Z(:,8)==3);
figure(3)
