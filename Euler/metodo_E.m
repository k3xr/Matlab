function [xn,yn] = metodo_E(x0,y0,xfin,h,fun)
% Implementa el método de Euler
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
    yn(n) = yn(n-1)+h*feval(fun,xn(n-1),yn(n-1)); % Iteración de Euler
end
return