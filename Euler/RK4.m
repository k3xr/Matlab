function [xn,yn] = RK4(x0,y0,xfin,h,fun)
% x0,y0     Condiciones iniciales
% x0, xfin  Intervalo de integración
% h         Tamaño del paso
% fun       Función f(x,y) que define la edo
% xn,yn     Tabla de valores
numpunt = (xfin-x0)/h+1;
% numpunt   número de puntos
xn = x0:h:xfin;
lxn = length(xn);
% Discretización del tiempo
yn = zeros(1,lxn);
yn(1) = y0;
% Tabla de valores yn
for n = 2:numpunt
    
    k1 = feval(fun,xn(n-1),yn(n-1));
    k2 = feval(fun,xn(n-1)+(h/2),yn(n-1)+k1*(h/2));
    k3 = feval(fun,xn(n-1)+(h/2),yn(n-1)+k2*(h/2));
    k4 = feval(fun,xn(n-1)+h,yn(n-1)+k3*h);
    
    yn(n) = yn(n-1)+(h/6)*(k1+2*k2+2*k3+k4);
end
return