clear all;
t=0:0.001:1;
n=size(t,2);
X=zeros(n,2);
P=[1 1;2 3; 4 3;3 1];                 % 4 puntos de control
for k=1:n
    X(k,:)=c_bezier_casteljau(P,t(k));
end
subplot(131),plot(X(:,1),X(:,2),'b.')   % Poligono de control (rojo)
hold on
subplot(131),plot(P(:,1),P(:,2),'--ro')  % Curva de Bezier (azul)
title('Poligono de control (rojo) y curva de Bezier (azul)')

P=[1.5 1.2;1 1;2 3;2.2 1.8;2.6 1.8; 4 3;3 1;2.5 1.2];  % 8 puntos de control
for k=1:n
    X(k,:)=c_bezier_casteljau(P,t(k));
end
 
subplot(132),plot(X(:,1),X(:,2),'b.')    % Poligono de control (rojo)
hold on
subplot(132),plot(P(:,1),P(:,2),'--ro')  %  Curva de Bezier (azul)
title('Poligono de control (rojo) y curva de Bezier (azul)')

n=size(t,2);
X=zeros(n,3);
ii=0:0.1:5;
P=[sin(2*pi*ii);cos(2*pi*ii);ii]';
for k=1:n
    X(k,:,:)=c_bezier_casteljau(P,t(k));
end
 
subplot(133),plot3(X(:,1),X(:,2),X(:,3),'b.')    % Poligono de control (rojo)
hold on
subplot(133),plot3(P(:,1),P(:,2),P(:,3),'--ro')  %  Curva de Bezier (azul)
title('Poligono de control (rojo) y curva de Bezier (azul)')