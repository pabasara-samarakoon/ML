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

subplot(1,4,1);imshow(I);hold on;
subplot(1,4,2);imshow(P);hold on;
subplot(1,4,3);imshow(S);hold on;
subplot(1,4,4);imshow(R);