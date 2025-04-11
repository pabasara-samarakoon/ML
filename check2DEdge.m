I = imread('./images/pipe.jpg');
if length(size(I))==3
    I = rgb2gray(I);
end
%second derivative filters
%Laplace of gaussian
LoG = edge(I,'log');
%Canny
Canny = edge(I,'canny');

subplot(1,3,1);imshow(I);hold on;
subplot(1,3,2);imshow(LoG);hold on;
subplot(1,3,3);imshow(Canny);