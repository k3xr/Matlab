clear;
n=1:20;
x=10.^(-n);
xs = single(x);
fx = (exp(x)-1)./x;
fxs = (exp(xs)-1)./xs;
for n=1:20;
    fprintf('%2d => %12.8f %12.8f\n',n,fxs(1,n),fx(1,n));
end