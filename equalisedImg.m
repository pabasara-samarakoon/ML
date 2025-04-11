function I = equalisedImg(I)
    if length(size(I))==3
        I = rgb2gray(I);
    end
    k=256;
    [M,N] = size(I);
    h = histogram(I);
    H = cumulativeHist(h);

    for i = 1:M
        for j = 1:N
            a = I(i, j);  
            I(i, j) = floor((H(a + 1) * (k - 1)) / (M * N));
        end
    end
    