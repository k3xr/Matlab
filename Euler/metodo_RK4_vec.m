function [xn,yn]=metodo_RK4_vec(x0,y0,xfin,h,fun)
numpunt=(xfin-x0)/h+1;
xn=x0:h:xfin;lxn=length(xn);
yn=zeros(lxn,size(y0,2)); % Tabla de valores yn
for i=1:size(y0,2)
    yn(1,i)=y0(i);
end

for n=2:numpunt
    k1 = feval(fun,xn(n-1), yn(n-1,:));
    k2 = feval(fun,xn(n-1)+h/2, yn(n-1,:))+k1(:)'*h/2;
    k3 = feval(fun,xn(n-1)+h/2, yn(n-1,:)+k2(:)'*h/2);
    k4 = feval(fun,xn(n-1)+h, yn(n-1,:)+k3(:)'*h);
    
    yn(n,:) = yn(n-1,:) + (k1(:)'+2*k2(:)'+2*k3(:)'+k4(:)')*h/6;
end
end