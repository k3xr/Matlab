%r = pagerank

function [r,precision] = calculo_PR(A,nmax)

n=size(A,1);
r=ones(n,1);
e=ones(n,1); % Vector de arranque
alpha = 0.85;
iter=0;
r0=0;

%Calculamos a que hace la matriz dispersa

ns=sum(A); i=find(ns==0); a=sparse(i,1,1,n,1);

v = alpha*a'+(1-alpha)*e';


while (nmax > iter &&   norm(r0-r) > 1e-15);
    
    r0=r;
    qwe = v*r;
    qw = (1/n)*e*qwe;
    r = alpha*A*r+qw;
    r = r/sum(r);
    iter = iter + 1;
    
end
r0=r;
qwe = v*r;
qw = (1/n)*e*qwe;
r = alpha*A*r+qw;
r=r/sum(r);
precision = norm(r0-r);

fprintf('Iteraciones %i', iter);

return