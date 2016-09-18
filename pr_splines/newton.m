function y=newton(xi,fi,x)  % INterpolacion de Newton

L=length(xi);
for k=2:L
   dx=xi(k:L)-xi(1:L-k+1);
   fi(k:L) = (fi(k:L)-fi(k-1:L-1))./dx;
end   

y = fi(L);
for k=L-1:-1:1,
  y = y.*(x-xi(k))+fi(k);
end    
