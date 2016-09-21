%clear all
%clc
N=7;

%valor de tolerancia para saber si es estocástica
tol = 10e-15;
estocastica = 0;

j = [1 1 2 2 3 4 4 4 5 5 7];
i = [2 7 1 3 5 3 5 7 6 7 1];
alpha = 0.85; %Valor dado
E = ones(N,N)/N;

C = sparse(i,j, 1, 7, 7);

C = full(C)

whos C

%Devuelve el numero de elementos distintos de 0
num = nnz(C);

%Inicializamos A
A = ones(N,N);

for x=1:N
   if (sum(C(:,x)) == 0)
       A(:,x)=1/N;
   else
       A(:,x) = C(:,x)/sum(C(:,x));
   end
   
   %Puesto que todos los elementos estan entre 1-50 no tendremos números no
   %negativos. Queda comprobar si la matriz es estocástica
   if (abs(1-sum(C(:,x))) > tol)
       fprintf = ('Esta matriz no es estocastica');
   end
end



G = alpha*A+(1-alpha)*E %Matriz Google

[x, precision]=calculo_PR(A, 100)
[lambda,v,iter]=potencia(G)


for x=1:N
    if (abs(1-sum(G(:,x))) > tol)
       fprintf = ('G no es estocastica');
   end
end



