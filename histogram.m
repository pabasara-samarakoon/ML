function h = histogram(I)
    if length(size(I))==3
        I=rgb2gray(I);
    end
    h = zeros(1,256);
    [row,col] = size(I);
    for x = 1:row
        for y = 1:col
            a=I(x,y);
            h(a+1)=h(a+1)+1;
        end
    end 