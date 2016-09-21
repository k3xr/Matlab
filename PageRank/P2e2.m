clear all
clc

%Matriz de elementos aletarios no nulos menor a 50 (entre 1-50)
r = randi(100, 3, 5)

%valor de tolerancia para saber si es estocástica
tol = 10e-15;
estocastica = 0;

N=50;
p = randi(N, 1, 10*N);
q = randi(N, 1, 10*N);

S = sparse(p,q, 1, N, N); %M. dispersa 5x5

C = full(S);

whos S C

%Devuelve el numero de elementos distintos de 0
num = nnz(S);

for x=1:N
    if (sum(S(:,x)) == 0)
        S(:,x)=1/N;
    else
        S(:,x) = S(:,x)/sum(S(:,x));
    end
    
    %Puesto que todos los elementos estan entre 1-50 no tendremos números no
    %negativos. Queda comprobar si la matriz es estocástica
    if (abs(1-sum(S(:,x))) > tol)
        fprintf = ('Esta matriz no es estocastica');
    end
end

[lambda,v,iter]=potencia(S);
fprintf('el autovalor mas alto es %.16f \n',lambda);

%comprobacion de que x (autovector) asociado a lambda
fprintf('norma de Sx-lambdax es: %.5e\n',norm(S*v-lambda*v));

