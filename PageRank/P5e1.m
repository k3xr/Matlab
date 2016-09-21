clear all
clc

A=loadStanfordMatrix;

%n = size(A,1)
r = randi(length(A),1,1e+4);

[x, precision]=calculo_PR(A, 100)

los = sort(x(r), 'descend');
bar(los(1:20))


