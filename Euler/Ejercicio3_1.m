clear
h=0.1;
[xn,yn]=metodo_E(0,1/2,1,h,'fun3');
plot(xn,yn,'.r');
hold on

[xn,yn]=RK2(0,1/2,1,h,'fun3');
plot(xn,yn,'.');
hold on

[xn,yn]=RK4(0,1/2,1,h,'fun3');
plot(xn,yn,'.');
hold on

realx = 0:0.1:1;
realy = exp(-log(2)*exp(-realx));
plot(realx, realy, 'b')