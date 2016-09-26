clear;
x0=1;s = 0.5671432904097838;
t=[1:10];
dec=zeros(1,10);
for k=1:10;
  x1 = exp(-x0); 
  fprintf('x(%d) = %.14f -> Erel = %.1e\n',k,x1,abs(x1-s)/s); 
  dec(k) = abs(x1-s)/s;
  x0=x1;
end
semilogy(t,dec);
