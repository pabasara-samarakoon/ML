x = load('wine.txt');
lbl = x( : ,1);
x( : , 1) = [];
x = [x lbl];