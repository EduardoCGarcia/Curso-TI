function [im_Binariza,im_Gray] = fprocesa(I)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
im_Gray = rgb2gray(I);
im_Binariza = im2bw(I);
end

