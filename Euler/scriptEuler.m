clear
h=1/2;[xn,yn]=metodo_E(0,10,20,h,'fun1');
plot(xn,yn,'.');hold on
title('Grafica solucion numerica con Metodo Euler')

h=1/2;[xn,yn]=RK2(0,10,20,h,'fun1');
plot(xn,yn,'.');hold on

h=1/2;[xn,yn]=RK4(0,10,20,h,'fun1');
plot(xn,yn,'.');hold on