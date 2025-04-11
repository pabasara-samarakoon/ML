%Filtering images in Frequency Domain

I = imread('.\..\images\lenna.png'); 
if length(size(I))==3
    I = rgb2gray(I);
end

[M, N] = size(I); 
  
%Fourier Transform of I
FT_img = fft2(double(I)); 
  
%Order value 
n = 2; % one can change this value accordingly 
  
%Cut-off Frequency 
D0 = 20; % one can change this value accordingly 
  
% Designing filter 
u = 0:(M-1); 
v = 0:(N-1); 
idx = find(u > M/2); 
u(idx) = u(idx) - M; 
idy = find(v > N/2); 
v(idy) = v(idy) - N; 
  
%meshgrid(v, u) returns 2D grid which contains the coordinates of vectors v and u.
[V, U] = meshgrid(v, u); 
  
% Calculating Euclidean Distance 
D = sqrt(U.^2 + V.^2); 
  
% determining the filtering mask 

%Ideal Lowpass Filter
IL = double(D <= D0);

%Ideal Highpass Filter
IH = double(D > D0); 

%Butterworth Lowpass Filter
BL = 1./(1 + (D./D0).^(2*n)); 

%Butterworth Highpass Filter
BH = 1./(1 + (D0./D).^(2*n)); 
  
% Convolution between the Fourier Transformed image and the mask 
FIL = IL.*FT_img; 
FIH = IH.*FT_img; 
FBL = BL.*FT_img; 
FBH = BH.*FT_img; 
  
% Getting the resultant image by Inverse Fourier Transform  
JIL = real(ifft2(double(FIL)));  
JIH = real(ifft2(double(FIH))); 
JBL = real(ifft2(double(FBL)));  
JBH = real(ifft2(double(FBH))); 
     
subplot(2, 3, 1), imshow(I), title('Input Image'); hold on;
subplot(2, 3, 2), imshow(JIL,[ ]);  title('Ideal Lowpass'); hold on;
subplot(2, 3, 3), imshow(JIH,[ ]); title('Ideal Highpass'); hold on;
subplot(2, 3, 4), imshow(I),  title('Input Image'); hold on;
subplot(2, 3, 5), imshow(JBL,[ ]); title('Butterworth Lowpass'); hold on;
subplot(2, 3, 6), imshow(JBH,[ ]); title('Butterworth Highpass');