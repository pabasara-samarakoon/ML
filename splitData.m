function [trData , teData] = splitData(data)
%load('\VOR\dataset\iris.txt')
[m,n] = size(data);
%train-test = 70:30
% perform random shuffle on the data
indices = randperm(m);
data = data(indices, :);
trData = [];
teData = [];
nTr = round(m*0.7);
trData = data(1:nTr, :);
teData = data(nTr+1:m, : );