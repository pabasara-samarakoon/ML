I = imread('./images/cameraman.jpg');
F = [3,5,3;5,9,5;3,5,3];
J = linearFilter(I,F);

subplot(1,3,1);imshow(I);hold on;
subplot(1,3,2);imshow(J);