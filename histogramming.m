
CB = load('Codebook4Faces.txt');
K = size(CB,1);

subjects = 40;
nTrImgs = 7;
nTeImgs = 3;
nImgs = nTrImgs+nTeImgs;

hist = [];
lbl =[];

%Training Set
for sub = 1:subjects
    descrips = []; h = zeros(1,K);
    for faces = 1:nTrImgs
        % load SIFT descriptors
        fname = ['s' int2str(sub) '-' int2str(faces) 'Descrips.txt'];
        descrips = load(fname);
        
        %histogramming   
        for des = 1:size(descrips,1)
            for code = 1:K
               dist(code) = norm(descrips(des,:)- CB(code,:));
            end
            [elt,index] = min(dist);
            h(index) = h(index) + 1;
        end
        hist = [hist; h];
    end
    lbl = [lbl;sub*ones(nTrImgs,1)];  
end
hist = [hist lbl];

save('TrainingHists.txt','hist','-ASCII');

%Testing Set
hist = [];
lbl =[];

for sub = 1:subjects
    descrips = []; h = zeros(1,K);
    for faces = (nTrImgs+1):nImgs
        % load SIFT descriptors
        fname = ['s' int2str(sub) '-' int2str(faces) 'Descrips.txt'];
        descrips = load(fname);
        
        %histogramming   
        for des = 1:size(descrips,1)
            for code = 1:K
               dist(code) = norm(descrips(des,:)- CB(code,:));
            end
            [elt,index] = min(dist);
            h(index) = h(index) + 1;
        end
        hist = [hist; h];
    end
    lbl = [lbl;sub*ones(nTeImgs,1)];  
end
hist = [hist lbl];

save('TestingHists.txt','hist','-ASCII');

