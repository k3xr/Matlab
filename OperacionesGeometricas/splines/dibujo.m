% Dibujar perfil de tu mano
% Arranca la siguiente interface gráfica. 
% 1. Dibujar el poligono de control del perfil de tu mano:
%        Con el boton de la izda del ratón, añadimos puntos
%        Con el boton de la drcha del ratón, añadimos el último punto
% 2. Calculamos la curva B-spline anclada con esos puntos de control y nodos equidistantes
% 3. Dibujamos los puntos de control, el poligono de control y la curva B-spline
 
clear all
figure('position',get(0,'screensize'))
axes('position',[0 0 1 1])
axis equal,
grid(gca,'minor')
title('grid minor')
axis([0 10 0 10])
hold on
% Initially, the list of points is empty.
xy = [];
n = 0;
% Loop, picking up the points.
disp('Left mouse button picks points.')
disp('Right mouse button picks last point.')
but = 1;
while but == 1
    [xi,yi,but] = ginput(1);
    plot(xi,yi,'ro')
    n = n+1;
    xy(:,n) = [xi;yi];
end
 
% Calculamos la curva B-spline
P=xy';            % Puntos de control
n=size(P,1);      % n=numero puntos control
p=3;              % p=grado del B-spline
m=n+p+1;          % Ecuacion fundamental: m=numero de nodos
U=zeros(1,m);     % Tabla de nodos
U(end-2:end)=1;   % Nodos anclados
U(4:end-3)=0:(1/(m-7)):1; % Nodos equidistantes
 
t=0:0.001:1;
nt=size(t,2);
for k=1:nt-1
    X(k,:)=b_spline_boor(P,p,U,t(k)); % Calculo el punto de la curva C(t(k))
end
 
plot(P(:,1),P(:,2),'--ro',X(:,1),X(:,2),'b.') % Dibujamos los puntos control, polinomio de control y la curva B-spline

%%%% volvemos a pintar encima del primer dibujo en otro color

hold on
% Initially, the list of points is empty.
xy = [];
n = 0;
% Loop, picking up the points.
disp('Left mouse button picks points.')
disp('Right mouse button picks last point.')
but = 1;
while but == 1
    [xi,yi,but] = ginput(1);
    plot(xi,yi,'ro')
    n = n+1;
    xy(:,n) = [xi;yi];
end
 
% Calculamos la curva B-spline
P=xy';            % Puntos de control
n=size(P,1);      % n=numero puntos control
p=3;              % p=grado del B-spline
m=n+p+1;          % Ecuacion fundamental: m=numero de nodos
U=zeros(1,m);     % Tabla de nodos
U(end-2:end)=1;   % Nodos anclados
U(4:end-3)=0:(1/(m-7)):1; % Nodos equidistantes
 
t=0:0.001:1;
nt=size(t,2);
for k=1:nt-1
    X(k,:)=b_spline_boor(P,p,U,t(k)); % Calculo el punto de la curva C(t(k))
end
 
plot(P(:,1),P(:,2),'--bo',X(:,1),X(:,2),'g.') % Dibujamos los puntos control, polinomio de control y la curva B-spline