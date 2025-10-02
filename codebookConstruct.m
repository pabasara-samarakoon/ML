subjects = 40;
nTrImgs = 7;
K = 10;
GCB = [];

for sub = 1:subjects
    descrips = [];
    for faces = 1:nTrImgs % number of training images
        % load SIFT descriptors
        fname = ['s' int2str(sub) '-' int2str(faces) 'Descrips.txt'];
        d = load(fname);        
        descrips = [descrips; d];
    end
    
    %Constructing category-specific codebook
    tic
    [idx,CB] = kmeans(descrips,K);
    toc
    
    %Concatenating category-specific codebook
    GCB = [GCB; CB]; 
end
    

save('Codebook4Faces.txt', 'GCB', '-ASCII');




%Concatenating category-specific codebook
CB = [CB1;CB2];

save('codebook.mat','CB');