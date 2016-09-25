function  s=secante(fx,I,tol)
% Entrada fx, string con el nombre de la función cuyo cero deseamos hallar.
%         I = intervalo [x0 x1] = puntos iniciales para la iteración
%         tol = error RELATIVO máximo aceptable
%
% Salida  s  estimación de raíz 

x0 = I(1);
x1 = I(2);
x2=0;
k=0;
if(nargin==2), tol=1e-50;end

    f0=feval(fx,x0);
    while(tol <abs(x1-x0)/abs(x1) && k<50);
        k=k+1;
        f1=feval(fx,x1);
        fp=(f1-f0)/(x1-x0);
        x2= x1-f1/fp;
        erel=abs(x1-x0)/abs(x1);
        fprintf('iteracion %2d  estimacion de raiz:%18.16f error relativo estimado %4.2e\n',k,x2,erel)
        x0= x1; f0=f1;
        x1= x2;
        
    end
    s=x2;
