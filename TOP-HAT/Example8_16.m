clear all
close all

A = imread('rice.png');             	%Read in unevenly illuminated image
se = strel('disk',10);
%se = strel('disk',12);
%se = strel('disk',4);              	%Define structuring element
Atophat = imbothat(A,se);               %Apply tophat filter
%Atophat = imbothat(A,se);
subplot(1,3,1), imshow(A);          	%Display Original
subplot(1,3,2), imshow(Atophat)     	%Display raw filtered image
B = imadjust(Atophat);                  %Contrast adjust filtered image
subplot(1,3,3), imshow(B);          	%Display filtered and adjusted mage
