function [lambda, x,iter] = potencia(A,tol,nmax,x0)
if nargin == 1
    tol = 1e-15; % Tolerancia
    x0=ones(size(A),1); % Vector de arranque
    nmax=100; % Nº máx iteraciones
end 
iter=0;
lambda=1;
lambda2=2;
x=0;
 
    while (nmax > iter) && (abs(lambda)~= 0) && ((abs(lambda - lambda2))>(tol*abs(lambda)));
        
        lambda = lambda2;
        x = x0; 
        x=x/norm(x);
        x0 = A*x;
        iter = iter + 1;
        
        lambda2 = x' * x0;
    end
    lambda=lambda2;
    x=x0/sum(x0);
return
