clear
y0in = 1/1024;
h = 0.125;
tol = 0.001;

[xn,yn] = metodo_RK2_adaptativo(0, y0in, 4, h, tol, 'fun6');
plot(xn,yn,'.b');
hold on;
xn = 0:0.01:4;
for i=1:length(xn)
     yn(i) = feval('fun6exacta',xn(i));
end
plot(xn,yn,'r');