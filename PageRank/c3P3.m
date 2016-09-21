clear all
clc
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

fprintf('google mostrara las paginas de la forma P1 > P7 > P2 > P5 > P3 > P6 > P4 \n');

autovalG = eig(G) %Verifica el teorema de Perron-Frobenius
display(iter); %numero de iteraciones, velocidad de convergencia

%Respuestas Punto 3, segunda parte caso 3.
%El valor que otorga google a alpha es un valor que trata de reflejar la
%probabilidad de que un surfista no siga links the una página y salte a
%otra.

%El incluir este valor conlleva el coste computacional de calcular G este
%coste en relación al programa es:

%Tiempo en calcular G = 0.052s
%Tiempo total de ejecución = 0.058s

%Aunque el tiempo es relativamente pequeño 0,06s de diferencia, esto se
%puede deber a que nuestra matriz es pequeña y en matrices más grandes este
%tiempo podría ser muco mayor.



