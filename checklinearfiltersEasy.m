I = imread('./images/cameraman.jpg');

H1 = fspecial('unsharp');
USM = imfilter(I,H1);

H2 = fspecial('average');
Box = imfilter(I,H2);

H3 = fspecial('gauss'); 
Gauss = imfilter(I,H3);

H4 = fspecial('laplacian');
MexHat = imfilter(I,H4);

subplot(1,5,1);imshow(I);hold on;
subplot(1,5,2);imshow(USM);hold on;
subplot(1,5,3);imshow(Box);hold on;
subplot(1,5,4);imshow(Gauss);hold on;
subplot(1,5,5);imshow(MexHat);

