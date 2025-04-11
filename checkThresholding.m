I = imread('./images/cameraman.jpg');
h1 = histogram(I);
J = thresholding(I,125);
h2 = histogram(J);
subplot(2,2,1);imshow(I);hold on;
subplot(2,2,2);bar(h1);hold on;
subplot(2,2,3);imshow(J);hold on;
subplot(2,2,4);bar(h2);