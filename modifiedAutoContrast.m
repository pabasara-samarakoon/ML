function I = modifiedAutoContrast(I)
    if length(size(I))==3
        I = rgb2gray(I);
    end
    [M,N]=size(I);
    amin = 0;
    amax = 255;
    qlow = 0.005;
    qhigh = qlow;
    h = histogram(I);
    H = cumulativeHist(h);
    allow = min(find( H >= M*N*qlow ));
    alhigh = max(find (H <= M*N*qhigh ));
    for i = 1:M
        for j = 1:N
            a = I(i,j);
            if ( a<=allow )
                I(i,j) = amin;
            else if( a>=alhigh )
                I(i,j) = amax;
                else
                I(i,j)=amin+(a-allow)*((amax-amin)/(alhigh-allow));
                end
            end
        end
    end