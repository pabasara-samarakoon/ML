I = imread('./images/barbara.jpg');
if length(size(I))==3
    I = rgb2gray(I);
end
%add noise using gaussian filter
%IG = imnoise(I,'gaussian');
IG = imnoise(I,'salt & pepper');
%Minimum Filter
f = @(x) min(x(:));
JMin = nlfilter(I,[3 3],f);
%Maximum Filter
f = @(x) max(x(:));
JMax = nlfilter(I,[3 3],f);
%Median Filter
f = @(x) median(x(:));
JMed = nlfilter(I,[3 3],f);

subplot(1,5,1);imshow(I);hold on;
subplot(1,5,2);imshow(IG);hold on;
subplot(1,5,3);imshow(JMin);hold on;
subplot(1,5,4);imshow(JMax);hold on;
subplot(1,5,5);imshow(JMed);