I = imread('./images/Lenna.png');
h = histogram(I);
subplot(2,2,1);imshow(I);hold on;
subplot(2,2,2);bar(h);hold on;
subplot(2,2,3);imshow(rgb2gray(I));hold on;
subplot(2,2,4);bar(h);