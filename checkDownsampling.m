I = imread('./images/cameraman.jpg');
h = histogram(I);
I1 = downsampling(I);
h1 = histogram(I1);
I2 = downsampling(I1);
h2 = histogram(I2);

subplot(3,2,1);imshow(I);hold on;
subplot(3,2,2);bar(h);hold on;
subplot(3,2,3);imshow(I1);hold on;
subplot(3,2,4);bar(h1);hold on;
subplot(3,2,5);imshow(I2);hold on;
subplot(3,2,6);bar(h2);
