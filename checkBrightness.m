I = imread('./images/Lenna.png');
h1 = histogram(I);
J1 = brightness(I,-50);
h2 = histogram(J1);
J2 = brightness(I,50);
h3 = histogram(J2);
J3 = brightness(I,-125);
h4 = histogram(J3);
J4 = brightness(I,125);
subplot(3,3,1);imshow(I);hold on;
subplot(3,3,2);bar(h1);hold on;
subplot(3,3,3);imshow(J1);hold on;
subplot(3,3,4);bar(h2);hold on;
subplot(3,3,5);imshow(J2);hold on;
subplot(3,3,6);bar(h3);hold on;
subplot(3,3,7);imshow(J3);hold on;
subplot(3,3,8);bar(h4);hold on;
subplot(3,3,9);imshow(J4);