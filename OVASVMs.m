function accuracy = OVASVMs(data,N)
%N - number of classes
%nTest - number of training samples from each classes

[trainData,teData] = splitData(data);
%[trData,teData) = scaleData(trainData,teData);
[trData,valData] = splitData(trainData);

A = 1:N;%generate class numbers for NvsAll classifiers
%C = [2^-10 :?:2^10];%find ?
C = [2^-10,2^-9,2^-8,2^-7,2^-6,2^-5,2^-4,2^-3,2^-2,2^-1,2^0,2^1,2^2,2^3,2^4,2^5,2^6,2^7,2^8,2^9,2^10];
accuracy = [];

for i=1:length(C)
    options = svmlopt('C' , C(i) , 'Verbosity' ,0);
    predict = [];
    
    for class=1:N
        %training data and make model
        Model = ['Model',int2str(A(class)),'VsAll'];
        x = invertData(trData,A(class));
        y = x(:,end);
        x(:,end) = [];
        svmwrite('SVMTrain',x,y);
        svm_learn(options,'SVMTrain',Model);
        %validation data
        xval = invertData(valData,A(class));
        yval = xval(:,end);
        xval(:,end) = [];
        svmwrite('SVMVal',xval,yval);
        ModelOutput = ['OutPut',int2str(A(class)),'VsAll'];
        svm_classify(options,'SVMLVal',Model,ModelOutput);
        svmpredict = svmlread(ModelOutput);
        predict = [predict , svmpredict];
    end%for class
    
    accuracy(i) = WinnerTakesAll(valData,predict,A);
end%for i

[elt,ind] = max(accuracy);
cOpt = C(ind);
        
        

