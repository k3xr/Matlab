clear;
a=1;b=1/sqrt(2);t=1/4;x=1;
appi= ((a+b)^2)/(4*t);
e=(pi-appi);
iter = 0;
fprintf('iter %d Aprox. pi = %.18f Error = %.10f\n',iter,appi,e);
while(iter<10)
    iter=iter+1;
    y=a;a=(a+b)/2;b=sqrt(b*y);t=t-x*(y-a)^2;x=2*x;
    appi= ((a+b)^2)/(4*t);
    e=(pi-appi);
    fprintf('iter %d Aprox. pi = %.18f Error = %.10f\n',iter,appi,e);
end