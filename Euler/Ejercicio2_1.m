clear
h=1/2;
[xn,yn]=metodo_E(0,140,20,h,'fun2');
plot(xn,yn,'b');
hold on
h=1/4;
[xn,yn]=metodo_E(0,140,20,h,'fun2');
plot(xn,yn,'r');
hold on
h=1/8;
[xn,yn]=metodo_E(0,140,20,h,'fun2');
plot(xn,yn,'g');
hold on
h=1/16;
[xn,yn]=metodo_E(0,140,20,h,'fun2');
plot(xn,yn,'m');
hold on