function [xn,yn] = RK2(x0,y0,xfin,h,fun)
% x0,y0     Condiciones iniciales
% x0, xfin  Intervalo de integración
% h         Tama�o del paso
% fun       Funci�n f(x,y) que define la edo
% xn,yn     Tabla de valores
numpunt = (xfin-x0)/h+1;
% numpunt   n�mero de puntos
xn = x0:h:xfin;
lxn = length(xn);
% Discretizaci�n del tiempo
yn = zeros(1,lxn);
yn(1) = y0;
% Tabla de valores yn
for n = 2:numpunt
    yn2 = yn(n-1)+h*feval(fun,xn(n-1),yn(n-1));
    yn(n) = yn(n-1)+h*(feval(fun,xn(n-1),yn(n-1))+feval(fun,xn(n),yn2))/2;
end
return