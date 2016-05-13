function f=fun7(t,y)
f = 0*y;   
f(1) = 1+y(1)*(y(1)*y(2)-4);
f(2) = y(1)*(3-y(1)*y(2));
return