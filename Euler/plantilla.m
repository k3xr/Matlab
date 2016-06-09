% Ejecución. Resolver y’(x)=0.2*y.*(1-y/100), y(0)=10 en [0,20] utilizando Método Euler, y 
% tamaño de paso h=1/2. Gráfica 
clear 
h=1/2;[xn,yn]=metodo_E(0,10,20,h,'fun1'); 
plot(xn,yn,'.');hold on 
title('Gráfica solucion numerica con Metodo Euler, RK2 y RK4') 

[xn,yn]=metodo_RK2(0,10,20,h,'fun1'); 
plot(xn,yn,'.r');hold on 

[xn,yn]=metodo_RK4(0,10,20,h,'fun1'); 
plot(xn,yn,'.k');hold off

%% 1. Implementar metodos de Heun (metodo_RK2) y Runge-Kutta (metodo_RK4)

% DONE

%% 2. Resolver por el método de Euler un pvi con diferentes tamaños de paso y diferentes condiciones iniciales. 
% 2.1.  Resolver por el método de Euler el siguiente pvi y dibujar las
% graficas superpuestas
figure

h=1/2;
[xn,yn]=metodo_E(0,140,20,h,'fun2'); 
plot(xn,yn,'');hold on 

h=1/4;
[xn,yn]=metodo_E(0,140,20,h,'fun2'); 
plot(xn,yn,'r');hold on 

h=1/8;
[xn,yn]=metodo_E(0,140,20,h,'fun2'); 
plot(xn,yn,'k');hold on 

h=1/16;
[xn,yn]=metodo_E(0,140,20,h,'fun2'); 
plot(xn,yn,'g');hold off

title('Gráfica solucion numerica con Metodo Euler')
legend('h=1/2', 'h=1/4', 'h=1/8', 'h=1/16')

% 2.2. Resolver por el método de Euler simultáneamente los siguientes pvi’s con h=0.1
% Condiciones iniciales: x0=0, y0= 0:1:160
figure
h=0.1;
for i=0:159
    [xn,yn]=metodo_E(0,i,20,h,'fun2'); 
    plot(xn,yn);hold on
end
[xn,yn]=metodo_E(0,160,20,h,'fun2'); 
plot(xn,yn,'r');hold off
title('Gráfica solucion numerica con Metodo Euler')

%% 3. Resolver el siguiente pvi y comparar la velocidad de convergencia de los 3 metodos
% 3.1. Intervalo [0,1] y el tamaño de paso h=0.1
figure

% Se calcula la solución exacta
xn1 = 0:0.1:1; yn1=zeros(1,length(xn1));
for i=1:length(xn1)
    yn1(i) = fun3_exacta(xn1(i));
end
plot(xn1,yn1,''); hold on

% Se resuelve con cada uno de los tres métodos
h=0.1;
[xn,yn]=metodo_E(0,1/2,1,h,'fun3'); 
plot(xn,yn,'.g');hold on 

[xn,yn]=metodo_RK2(0,1/2,1,h,'fun3'); 
plot(xn,yn,'.r');hold on 

[xn,yn]=metodo_RK4(0,1/2,1,h,'fun3'); 
plot(xn,yn,'.k');hold off

title('Gráfica solucion numerica con Metodo Euler, Heun y RK4')
legend('Sol exacta', 'Euler', 'Heun', 'RK4', 'location', 'northwest')

% 3.2. Comparar la velocidad de convergencia de los tres metodos.
figure

error = zeros(3,5);
res_exacta = fun3_exacta(1);
for k=1:5 % Hasta 10^(-5) para que no tarde tanto
    h=10^(-k);
    [xn,yn]=metodo_E(0,1/2,1,h,'fun3'); 
    error(1,k) = abs(res_exacta-yn(length(yn)));
    [xn,yn]=metodo_RK2(0,1/2,1,h,'fun3'); 
    error(2,k) = abs(res_exacta-yn(length(yn)));
    [xn,yn]=metodo_RK4(0,1/2,1,h,'fun3'); 
    error(3,k) = abs(res_exacta-yn(length(yn)));
    
    loglog(10.^-k,error(1,k),'bo-',10.^-k,error(2,k),'go-',10.^-k,error(3,k),'ro-'); hold on
end
title('Error cometido por Euler (azul), Heun (verde) y RK4 (rojo), respecto del tamaño del paso') ; hold off

%% 4. Resolver el modelo de los dos edo's con RK4. Dibujar las gráficas en el intervalo [0, 10].
% Dibujar las soluciones en el plano de fases (y1 en una coordenada y y2 en la otra)
h=0.1;

[xn,yn]=metodo_RK4_vec(0,1.2,10,h,'fun4',2); 
plot(yn(1,:), yn(2,:))

figure
[xn,yn]=metodo_RK4_vec(0,2,10,h,'fun4',2); 
plot(yn(1,:), yn(2,:))