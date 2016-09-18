function x1=iter_newton(C,x0)
% Entrada:  C   coefs del polinomio.
%           x0  punto inicial 
% Salida :  x1  resultado de aplicar Newton a x0:  x1 = x0 - p(x0)/p'(x0)
evC = polyval(C,x0);         %Evaluar polinomio de coeficientes C en x0 usando polyval
n = length(C)-1;
coefD = C(1:n).*[n:-1:1];             %Calcular los coeficientes D del polinomio derivada
evD = polyval(coefD,x0);          %Evaluar derivada del polinomio D en x0 usando polyval
x1 = x0-(evC./evD);               %Aplicar Newton x0 – p(x0)/p'(x0) para obtener x1


return