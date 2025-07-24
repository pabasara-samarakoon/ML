function accuracy = OVASVMs(data,N)
%linear One vs All support vector machine->N classifiers , linear is type
%of kernal (C)-----------------------------------
%binary / multiclass
%multiclass-OVO,OVA,DAG...-----------------------
%N - number of classes
%nTest - number of training samples from each classes

[trainData,teData] = splitData(data);
%[trData,teData) = scaleData(trainData,teData);
[trData,valData] = splitData(trainData);
% 1.split data , 2.scale data , if linear , 4.ova
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
        svmlwrite('SVMTrain',x,y);
        svm_learn(options,'SVMTrain',Model);
        %validation data
        xval = invertData(valData,A(class));
        yval = xval(:,end);
        xval(:,end) = [];
        svmlwrite('SVMVal',xval,yval);
        ModelOutput = ['OutPut',int2str(A(class)),'VsAll'];
        svm_classify(options,'SVMLVal',Model,ModelOutput);
        svmpredict = svmlread(ModelOutput);
        predict = [predict , svmpredict];
    end%for class
    
    accuracy(i) = WinnerTakesAll(valData,predict,A);
end%for i

%find best C
[elt,ind] = max(accuracy);
cOpt = C(ind);

%Testing using optimal C
options = svmlopt('C',cOpt , 'Verbosity' ,0);
predict = [];

    for class=1:N
        %training data and make model
        Model = ['Model',int2str(A(class)),'VsAll'];
        x = invertData(trData,A(class));
        y = x(:,end);
        x(:,end) = [];
        svmwrite('SVMTrain',x,y);
        svm_learn(options,'SVMTrain',Model);
        %testing data
        xtest = invertData(teData,A(class));
        ytest = xtest(:,end);
        xtest(:,end) = [];
        svmwrite('SVMTest',xtest,ytest);
        ModelOutput = ['ModelOutPut',int2str(A(class)),'VsAll'];
        svm_classify(options,'SVMLTest',Model,ModelOutput);
        svmpredict = svmlread(ModelOutput);
        predict = [predict , svmpredict];
    end%for class
    
    accuracy(i) = WinnerTakesAll(teData,predict,A);

    

    
        
        
        

