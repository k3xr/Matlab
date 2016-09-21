clear all
clc
N=7;

%valor de tolerancia para saber si es estocástica
tol = 10e-15;
estocastica = 0;

i = [1 1 2 2 3 4 4 4 5 5 6 7]';
j = [2 7 1 3 5 3 5 7 6 7 7 1]';

C = sparse(j,i, 1, 7, 7);

C = full(C)

whos C

%Devuelve el numero de elementos distintos de 0
num = nnz(C)

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

C

[lambda,v,iter]=potencia(C);
fprintf('el autovalor mas alto es %.16f \n',lambda);

pagerank = v;

%comprobacion de que x (autovector) asociado a lambda
fprintf('norma de Sx-lambdax es: %.5e\n',norm(C*v-lambda*v));

bar(pagerank);

fprintf('google mostrara las paginas de la forma P1 > P2 > P4 > P7 > P5 > P3 > P6 \n');
fprintf('El valor de pagerank de P1 > P7 ya que P7 solo apunta a P1 \ny P1 apunta a P2 y P7 por lo que su importancia se divide \n');

fprintf('el valor de A(2,3) = 0.5 significa que P3 es apuntada desde P2 (y otra pagina)');
fprintf('el valor de A(3,2) = 0 significa que P2 no es apuntada desde P3');