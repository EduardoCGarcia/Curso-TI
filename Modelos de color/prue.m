%RGB --> HSV
A=imread('cromo.jpg');
cmap = rgb2hsv(A);
d1=cmap(:,:,1);  %H
d2V=cmap(:,:,2);  %S
d3V=cmap(:,:,3);  %V
R = A(:,:,1);
  

%[centers, radii, metricBright] = imfindcircles(Im_f,[15 33], ...
 %   'ObjectPolarity','dark','Sensitivity',0.68,'EdgeThreshold',0.18);
figure(1); imshow(d1);
%hBright = viscircles(centers, radii,'EdgeColor','b');

%delete(hBright);

[centers1, radii1, metricBright1] = imfindcircles(Im_f,[15 33], ...
    'ObjectPolarity','bright','Sensitivity',0.95,'EdgeThreshold',0.18);
hBright = viscircles(centers1, radii1,'LineStyle','--');

%figure(2);imshow(d3V);title('TODOS ');
%hBright2 = viscircles(centersBright, radiiBright,'LineStyle','--');
%[centers, radii, metricBright2] = imfindcircles(d3V,[10 33], ...
 %   'ObjectPolarity','dark','Sensitivity',0.9,'EdgeThreshold',0.1);
%delete(hBright2);


todos = length(centers)
blancos = length(centers1)

rojos = todos - blancos

