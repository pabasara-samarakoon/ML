x = load('wine.txt');
[train,test] = splitData(x);
accuracy = nn(train,test);
disp(accuracy);