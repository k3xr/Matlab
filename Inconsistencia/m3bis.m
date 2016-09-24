%Matriz pasada debe ser cuadrada

function [w] = metodo_3(M)

%Necesitamos hacer los logaritmos de los elementos de la matriz
%Bucle filas
l = M;
n=size(M);
n=n(1);
for i=1:1:n
    %Bucle columnas
    for j=1:1:n
        l(i,j) = log(M(i,j));
    end
end
%En este punto debemos tener la matriz con todos los elementos siendo
%log = ln en matlab

%Ahora debemos aplicar l(ij)= wi-wj. NOTA: son logaritmos neperianos
%pero como ya hemos aplicado la operacion ln.

B = zeros([n*n+1, n+1]);
%Primero filas
filaActual = 1;
numeroFilaL = 1;
for i=1:1:n
    k=1;
    for j=filaActual:1:filaActual+n-1
      B(j,n+1)= -l(numeroFilaL,k);
      B(j,numeroFilaL) = B(j,numeroFilaL)+1;
      B(j,k) = B(j,k)-1;
      k=k+1;
    end
    filaActual = filaActual+ n;
    numeroFilaL = numeroFilaL+ 1;
end

for i=1:1:n
    B(n*n+1,i) = 1;
end

v = B(:,1:n)\-B(:,n+1);

w = size(n);
for i=1:1:n
   w(i) = exp(v(i));
end

x = sum(w);

%Ahora obtenemos el vector w
for i=1:1:n
   w(i) = w(i)/x;
end 

for i=1:1:n
   mediaG(i,1) = prod(M(i,:))^(1/3);
end 

w = w./sum(w);

end