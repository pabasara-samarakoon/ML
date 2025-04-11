I = imread('./images/cameraman.jpg');

%Box Filter
B = ones(3,3);
IB = linearFilter(I,B);

%Gauss Filter
G = [3,5,3;5,9,5;3,5,3];
IG = linearFilter(I,G);

subplot(1,3,1);imshow(I);hold on;
subplot(1,3,2);imshow(IB);hold on;
subplot(1,3,3);imshow(IG);

