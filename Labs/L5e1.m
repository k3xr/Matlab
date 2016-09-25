clear;
xi =[1;2;4;5];
yi =[0;-1;3;-4];
H= [xi.^0 xi.^1 xi.^2 xi.^3];
c=H\yi;
xx = 0:0.01:6;
poli =polyval(c(end:-1:1),xx);
plot(xi,yi,'rs',xx,poli,'b');hold on;

H2 = [sin(xi) cos(xi) sin(2.*xi) cos(2.*xi)];
c=H2\yi;
P = c(1)*sin(xx) + c(2)*cos(xx) + c(3)*sin(2.*xx) + c(4)*cos(2.*xx);
plot(xx,P,'k:');