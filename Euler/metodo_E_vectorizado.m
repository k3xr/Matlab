function [xn,yn]=metodo_E_vectorizado(x0,y0,xfin,h,fun) 
%Implementa el metodo de Euler vectorizado
%x0,y0,         Condiciones iniciales
%x0,xfin,       Intervalo de integracion
%h              Tamaño del paso
%fun            Funcion f(x,y) que define la edo
%xn,yn          Tabla de valores
numpunt=(xfin-x0)/h+1;                 
% numpunt numero de puntos
xn=x0:h:xfin;
lxn=length(xn);
% Discretizacion del tiempo
yn=zeros(length(y0),lxn);
yn(:,1)=y0;              
% Matriz de valores yn ahora con tamaño de filas del vector y0
y=0*y0;
for n=2:numpunt
   y = feval(fun,xn(n-1),yn(:,(n-1)));
   yn(:,n)=yn(:,n-1)+h*y;
end
return