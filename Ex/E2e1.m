clear;
T = [-2 -1 0 1 2]';

xx = [-3:0.01:3];
%plot(xx,fun(xx),'k',T,fun(T),'ko');hold on;

H1= [T.^0 T.^1 T.^2 T.^3 T.^4];
b1 = fun(T);
c1=H1\b1;
poli1 =polyval(c1(end:-1:1),xx);
%plot(xx,poli1,'b');
plot(xx, abs(fun(xx)-poli1),'b'); hold on;

H2= [T.^0 cos(T) sin(T) cos(2*T) sin(2*T)];
b2 = fun(T);
c2=H2\b2
poli2 = c2(1) + c2(2)*cos(xx) + c2(3)*sin(xx) + c2(4)*cos(2.*xx) + c2(5)*sin(2.*xx);
%plot(xx,poli2,'r');
plot(xx, abs(fun(xx)-poli2),'r');

hold off;