clear;
tn=[0:0.1:1]; N=length(tn); yn=randn(1,N);
t=[0:0.01:1];
y = spline3(tn,yn,t);
plot(tn,yn,'ro',t,y,'b');

