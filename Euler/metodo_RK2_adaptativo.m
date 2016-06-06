function [xn,yn]=metodo_RK2_adaptativo(x0,y0,xfin,h,tol,fun)
n=1;
xn=x0:h:xfin;
yn(:,n)=y0;
while (xn(n)) < xfin
    % Calcular Y1, W, Y2 con metodo_RK2_unaiteracion
    % Calcular Y3, E
    Y1 = metodo_RK2_unaiteracion(xn(n),yn(:,n)',h,fun);
    W =  metodo_RK2_unaiteracion(xn(n),yn(:,n)',h/2,fun);
    Y2 = metodo_RK2_unaiteracion(xn(n)+h/2,W,h/2,fun);
    Y3 = (4*Y2-Y1)/3;
    E = (Y2(1)-Y1(1))/3;
    if E > h*tol
        h=h/2;
    else
        n=n+1; % Iteramos: asignamos valores a xn(n) e yn(n)
        yn(:,n)= Y3;
        xn(n)= xn(n-1)+h;
        if E <= h*tol/4 && h <= 0.25
            h=2*h;
        end
    end
end
return