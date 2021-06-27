hhisteq = vision.HistogramEqualizer;
x=imread('tire.tif');
y=step(hhisteq,x);
imshow(x);title('Original');
figure, imshow(y);
title('Ecualizada');
figure, imhist(x); title('histograma img original');
figure, imhist(y); title('histograma img ecualizada');