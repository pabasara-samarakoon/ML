%SIFT  
%extractSIFT(objects,nImgs);
extractSIFT(2,20);

%codebook
%CB = constructCodebook(objects,nTrImgs,k);
CB = constructCodebook(2,14,20);

%feature representation-------->
%training vector
%TrVec = histogramming(objects,start,end,CB);
TrVec = histogramming(2,1,14,CB);

%testing vector
%TeVec = histogramming(objects,start,end,CB);
TeVec = histogramming(2,15,20,CB);

%classification
rate =  nn(TrVec,TeVec);
disp(rate);
