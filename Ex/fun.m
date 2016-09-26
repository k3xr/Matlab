function f=fun(t)
  f = 1-abs(t)/2;
  f(abs(t)>2)=0;
return