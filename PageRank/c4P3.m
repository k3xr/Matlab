clear all
clc
N=9;

%valor de tolerancia para saber si es estocástica
tol = 10e-15;
estocastica = 0;

j = [1 1 2 2 3 3 4 4 5 5 6 6 7];
i = [2 3 4 6 1 7 3 6 7 8 4 7 8];
alpha = 0.85; %Valor dado
E = ones(N,N)/N;

C = sparse(i,j, 1, N, N);

C = full(C)

whos C

%Devuelve el numero de elementos distintos de 0
num = nnz(C);

for x=1:N
   if (sum(C(:,x)) == 0)
       C(:,x)=1/N;
   else
       C(:,x) = C(:,x)/sum(C(:,x));
   end
   
   %Puesto que todos los elementos estan entre 1-50 no tendremos números no
   %negativos. Queda comprobar si la matriz es estocástica
   if (abs(1-sum(C(:,x))) > tol)
       fprintf = ('Esta matriz no es estocastica');
   end
end

S = C

G = alpha*S+(1-alpha)*E %Matriz Google

[lambda,v,iter]=potencia(C);
fprintf('el autovalor mas alto es %.16f \n',lambda);

for x=1:N
    if (abs(1-sum(G(:,x))) > tol)
       fprintf = ('G no es estocastica');
   end
end

pagerank = v;

%comprobacion de que x (autovector) asociado a lambda
fprintf('norma de Sx-lambdax es: %.5e\n',norm(C*v-lambda*v));

bar(pagerank);

autovalG = eig(G) %Verifica el teorema de Perron-Frobenius
display(iter); %numero de iteraciones, velocidad de convergencia