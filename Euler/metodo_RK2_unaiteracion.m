function yn1=metodo_RK2_unaiteracion(xn,yn,h,fun)
% yn1 es el resultado de iterar una vez RK2 a partir (xn,yn,h)
k1 = feval(fun,xn,yn);
k2 = feval(fun,xn+h,yn+k1*h);
yn1 = yn+h*(k1+k2)/2;
return