RGB = imread('circles.png');
figure; imshow(RGB);

I = rgb2gray(RGB);
threshold = graythresh(I);
bw = im2bw(I,threshold);
figure; imshow(bw)
bw = bwareaopen(bw,30);
se = strel('disk',2);
bw = imclose(bw,se);
bw = imfill(bw,'holes');
figure; imshow(bw)
labels=bwlabel(bw);
features = regionprops(labels,'Area','Centroid','Perimeter');
threshold=0.1; %0.94
figure; imshow(label2rgb(labels));
%hold on;
pause;
for i=1:numel(features)
    if((4*pi*features(i).Area/features(i).Perimeter^2)>threshold)
    plot(features(i).Centroid(1),features(i).Centroid(2),'ko');
    end
end
%hold of