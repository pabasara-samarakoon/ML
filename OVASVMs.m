function accuracy = OVASVMs(data,N)
%N - number of classes
%nTest - number of training samples from each classes

[trainData,teData] = splitData(data);
%[trData,teData) = scaleData(trainData,teData);
[trData,valData] = splitData(trainData);

A = 1:N;%generate class numbers for NvsAll classifiers
C = [2^-10 :?:2^10];%find ?
accuracy = [];

