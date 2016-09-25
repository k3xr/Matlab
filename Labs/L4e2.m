clear;
x = 0.99:0.0001:1.01;
p1 = (x-1).^7;
p2 = x.^7-7*x.^6+21*x.^5-35*x.^4+35*x.^3-21*x.^2+7*x-1;
plot (p1,'blue');hold on;plot (p2,'red');