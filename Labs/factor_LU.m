function [A,orden]=factor_LU(A,piv)
% Factorizacion Gauss con pivote -> devuelve L Y U dentro de A
% para extraer U y L de A: U = triu(A)
%                          L = tril(A,-1) + eye(N) 1's en la diagonal.
% Orden = permutaciones de filas realizadas en pivoteo
