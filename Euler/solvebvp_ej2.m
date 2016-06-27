clear all;
x = fzero(@shooting_error2,[-3,3])
% pinta la solución calculada (con el resultado de x)
[xn,yn] = metodo_E_vectorizado(1/2,[3,x],1,0.001,'fun9');
plot(xn,yn(1,:),'.r');
hold on

% pinta la solución real
iter = 1;
for i=1/2:0.001:1
    xnE(1,iter) = i;
    ynE(1,iter) = fun9exacta(i);
    iter = iter + 1; 
end

plot(xnE,ynE,'b');
hold on