% clear all 
clc
contador = 0;

%La matriz es dispersa y tiene 281903 filas y columnas.
% Y el numero de nodos en las multiplicación.

%La matriz ocupa 39255184 Bytes


A=loadStanfordMatrix;

contador = nnz(A);
fprintf('Numero de elementos nulos: \n%i', contador);

fprintf('\nIndice de dispersion de A: \n%i', contador/(281903*281903));

fprintf('\nNumero medio de outlink y inlinks: \n%i', (281903*281903)-contador);

fprintf('\nElementos no nulos en A(1:500,1:500): \n%i', nnz(A(1:500,1:500)));

ns = sum(A);
elementos = nnz(ns)
fprintf('\nNodos sin salida de la red: \n%i', elementos);

fprintf('\nNodos con salida de la red: \n%i', size(ns)-elementos);

%Se trata de la matriz C
nmax = 1000000000000;
[r,precision] = calculo_PR(A,nmax);

precision
memory
bar(r)

 
 

%spy(A)

% for x=1:281903
%     for y=1:281903
%         if (A(x,y)~=0)
%             contador = contador+1;
%         end
%     end
% end
% 
% indiceDispoersion=contador/(281903*281903);


