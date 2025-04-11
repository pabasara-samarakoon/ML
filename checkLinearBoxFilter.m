I = imread('./images/cameraman.jpg');
F = ones(3,3);
J = linearFilter(I,F);

subplot(1,3,1);imshow(I);hold on;
subplot(1,3,2);imshow(J);

