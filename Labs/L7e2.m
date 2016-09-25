clear;
T = [25 100 150 300]';
V = [1.4 0.075 0.010 0.00075]';
H = [T.^0 -T]; B = log(V);
c=H\B;
A=exp(c(1));
B=c(2);
VV=A*exp(-B*200);
TT=[0:0.01:300];
r=B-H*c
r1=V-(A*exp(-B.*T))
plot(T,V,'ro',TT,A*exp(-B.*TT),'b');