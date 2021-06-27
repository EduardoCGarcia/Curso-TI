hdr_image = hdrread('office.hdr'); 
figure;imshow(hdr_image)
rgb = tonemap(hdr_image); whos
figure;imshow(rgb)