 
% This code assumes VLFeat is installed (vl_sift).
% You can install it from: https://www.vlfeat.org
% Add it to MATLAB with:
% run('vlfeat-0.9.21/toolbox/vl_setup');

subjects = 40;
nImgs = 10;

for sub = 1:subjects
    descrips = [];
    for faces = 1:nImgs % number of images
        % read faces
        imgName = ['faces\s' int2str(sub) '\' int2str(sub) '.pgm'];
        I = imread(imgName);
        if length(size(I))==3
            I = rgb2gray(I);
        end
                
        % extract SIFT descriptors
        [f,d] = vl_sift(single(I));
        fname = ['s' int2str(sub) '-' int2str(faces) 'Descrips.txt'];
        save(fname, 'd', '-ASCII');
    end
end
        
        

        
