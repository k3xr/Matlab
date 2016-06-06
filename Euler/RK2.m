function [xn,yn] = RK2(x0,y0,xfin,h,fun)
% x0,y0     Condiciones iniciales
% x0, xfin  Intervalo de integraciÃ³n
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
    yn2 = yn(n-1)+h*feval(fun,xn(n-1),yn(n-1));
    yn(n) = yn(n-1)+h*(feval(fun,xn(n-1),yn(n-1))+feval(fun,xn(n),yn2))/2;
end
return