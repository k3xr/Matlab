function f=fun5(t,y)
f = 0*y;   
f(1) = y(2);
f(2) = y(2)*(t^(-1)+2*y(2)/y(1));
return