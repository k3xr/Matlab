%Matriz pasada debe ser cuadrada

function [w] = metodo_2(M)

%Bucle filas
n=size(M);
n=n(1);

B = zeros([n*n+1, n+1]);
%Primero filas
filaActual = 1;
numeroFilaL = 1;
for i=1:1:n
    k=1;
    for j=filaActual:1:filaActual+n-1
        B(j,numeroFilaL) = -1;
        B(j,k) = B(j,k)+M(numeroFilaL,k);
        k=k+1;
    end
    filaActual = filaActual+ n;
    numeroFilaL = numeroFilaL+ 1;
end

for i=1:1:n+1
    B(n*n+1,i) = 1;
end

w = B(:,1:n)\-B(:,n+1);

%Normalizamos
w = w./sum(w);
w = w';
end