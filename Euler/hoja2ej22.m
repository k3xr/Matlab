clear
h = 0.125;
tol = 0.001;
[xn,yn] = metodo_RK2_adaptativo(0, [1.5,3], 20, h, tol, 'fun7');
%plot(xn,yn(1,:), '.b');hold on
plot(xn,yn(2,:), '.r');hold on