x0=2; c = 6; s = c^(1/3);
t=[1:15];
dec=zeros(1,15);
for k=1:15;
  x1 = sqrt(c/x0); 
  fprintf('Iter %d :: x = %.15f -> Erel = %.2e\n',k,x1,abs(x1-s)/abs(s)); 
  dec(k) = -log10(abs(x1-s)/abs(s));
  x0=x1;
end
plot(t,dec);
