
%Matlab code for Fourier Transform
% fft2
% ifft2

f=zeros(30,30);
f(5:24,13:17)=1;
F=fft2(f, 256,256);
F2=fftshift(F);       
figure,imshow(log(1+abs(F2)),[]) 


I = imread('./images/circuit.jpg');
I = I(:,:,1); % Grab only the Red component to fake gray scaling
imshow(I)
PQ = paddedsize(size(I));
D0 = 0.05*PQ(1);

% Calculate the LPF
H = lpfilter('gaussian', PQ(1), PQ(2), D0); 

% Calculate the discrete Fourier transform of the image
F=fft2(double(I),size(H,1),size(H,2));

% multiply the Fourier spectrum by the LPF and apply the inverse, discrete Fourier transform 
LPF_I=real(ifft2(H.*F)); 

% Resize the image to undo padding
LPF_I=LPF_I(1:size(I,1), 1:size(I,2)); 
figure, imshow(LPF_I, [])


% Display the Fourier Spectrum

% move the origin of the transform to the center of the frequency rectangle
Fc=fftshift(F); 

% use abs to compute the magnitude (handling imaginary) and use log to brighten display
S2=log(1+abs(Fc)); 
figure, imshow(S2,[])