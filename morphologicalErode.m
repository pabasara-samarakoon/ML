%Erosion
BW1 = zeros(9,10);
BW1(4:6,4:7)=1;
SE = strel('square',3);
%SE = strel('disk',3);
BW2 = imerode(BW1,SE);

subplot(1,2,1);imshow(BW1);hold on;
subplot(1,2,2);imshow(BW2);
