clear
exactValue = exp(-log(2)*exp(-1));
n = 6;
errores = zeros(3,n); 

for k = 1:n
    h=10^-k;
    [xn,yn]=metodo_E(0,1/2,1,h,'fun3');
    errores(1,k) = abs(yn(end)-exactValue);
    h=10^-k;
    [xn,yn]=RK2(0,1/2,1,h,'fun3');
    errores(2,k) = abs(yn(end)-exactValue);
    h=10^-k;
    [xn,yn]=RK4(0,1/2,1,h,'fun3');
    errores(3,k) = abs(yn(end)-exactValue);
    
    loglog(10.^-k,errores(1,k),'bo-',10.^-k,errores(2,k),'go-',10.^-k,errores(3,k),'ro-')
    title('Error cometido por Euler (azul), Heun (verde) y RK4 (rojo), respecto del tama�o del paso')
    hold on
end