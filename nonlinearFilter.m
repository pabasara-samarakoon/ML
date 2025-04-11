I = imread('./images/saltPaper.png');
if length(size(I))==3
    I = rgb2gray(I);
end
%Minimum Filter
f = @(x) min(x(:));
JMin = nlfilter(I,[3 3],f);
%Maximum Filter
f = @(x) max(x(:));
JMax = nlfilter(I,[3 3],f);
%Median Filter
f = @(x) median(x(:));
JMed = nlfilter(I,[3 3],f);

subplot(1,4,1);imshow(I);hold on;
subplot(1,4,2);imshow(JMin);hold on;
subplot(1,4,3);imshow(JMax);hold on;
subplot(1,4,4);imshow(JMed);