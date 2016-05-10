function f = shooting_error(x)
% returns the error using Euler
[xn,yn] = metodo_E_vectorizado(1,[4,x],2,0.01,'fun5');
f = yn(end-1)-8;
end