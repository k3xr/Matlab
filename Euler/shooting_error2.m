function f = shooting_error2(x)
% returns the error using Euler
[xn,yn] = metodo_E_vectorizado(1/2,[3,x],1,0.001,'fun9');
f = yn(end-1)-3;
end