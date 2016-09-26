clear;
xi =[0.5 1.5 2.5 3.5 4.5]';
yi =[0.87 0.99 0.64 0.30 0.17]';
plot(xi,yi,'ks');hold on;
xx=[0:0.01:5];

H= [xi.^0 xi.^1 xi.^2 xi.^3];
b = yi;
c=H\b;
poli1 =polyval(c(end:-1:1),xx);
plot(xx, poli1,'r');

r1 = b-H*c

H2 = [xi.^0 log(xi) xi]; B2 = log(yi);
c2=H2\B2;
A=exp(c2(1))
B=c2(3);
plot(xx,A*xx.*exp(B.*xx),'b');

r2 = B2-H2*c2

hold off;