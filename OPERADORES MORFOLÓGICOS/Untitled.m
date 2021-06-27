
A=imread('text.png');                        				

B=imcrop(A);                             				
B1 = imrotate(B,90);

se11 = B1; se22 = ~B1;
se1=B; se2=~B;

bw=bwhitmiss(A,se1,se2); 
bw2=bwhitmiss(A,se11,se22); 

[i,j]=find(bw==1);
[k,l]=find(bw2==1);

subplot(1,3,1), imshow(A);                  			
subplot(1,3,2), imagesc(B); axis image; axis off; 
subplot(1,3,3), imshow(A); hold on; plot(j,i,'r*'); plot(l,k,'r*') 	