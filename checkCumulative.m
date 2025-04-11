I = imread('./images/lenna_gray.jpg');
h = histogram(I);
H = cumulativeHist(h);
subplot(1,3,1);imshow(I);hold on;
subplot(1,3,2);bar(h);hold on;
subplot(1,3,3);bar(H);