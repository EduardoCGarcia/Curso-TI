A = imread('coins.png');
figure; imshow(A);
d = imdistline;
pause;
delete(d);

[centers, radii] = imfindcircles(A,[25 40]) ;
centersStrong6 = centers(1:6,:);
radiiStrong6 = radii(1:6);

viscircles(centersStrong6,radiiStrong6,'EdgeColor','r');

