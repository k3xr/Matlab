clear all;
x = fzero(@shooting_error,[0,2])
% pinta la solución calculada (con el resultado de x)
[xn,yn] = metodo_E_vectorizado(1,[4,x],2,0.01,'fun5');
plot(xn,yn(1,:),'.r');
hold on

% pinta la solución real
iter = 1;
for i=1:0.01:2
    xnE(1,iter) = i;
    ynE(1,iter) = fun5exacta(i);
    iter = iter + 1; 
end

plot(xnE,ynE,'b');
hold on