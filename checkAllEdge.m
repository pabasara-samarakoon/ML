I = imread('./images/flag.png');
if length(size(I))==3
    I = rgb2gray(I);
end
%first derivative filters
%prewitt
P = edge(I,'prewitt');
%sobel
S = edge(I,'sobel');
%robert
R = edge(I,'roberts');

%second derivative filters
%Laplace of gaussian
LoG = edge(I,'log');
%Canny
Canny = edge(I,'canny');

subplot(2,3,1);imshow(I);hold on;
subplot(2,3,2);imshow(P);hold on;
subplot(2,3,3);imshow(S);hold on;
subplot(2,3,4);imshow(R);hold on;
subplot(2,3,5);imshow(LoG);hold on;
subplot(2,3,6);imshow(Canny);