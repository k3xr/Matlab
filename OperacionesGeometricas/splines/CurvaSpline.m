% clear all;
% P=[0 0; 1 0; -0.1 0.5; -0.2 3;3.2 3; 3.1 0.5; 2 0;3 0];
% U=[0 0 0 0 0.2 0.4 0.6 0.8 1 1 1 1];
% p=3; % Nodos y grado
% t=0:0.001:1;n=size(t,2);
% for k=1:n-1
%     X(k,:)=b_spline_boor(P,p,U,t(k)); % Calcula el punto C(t(k))
% end
% for k=5:length(U)-4
%     Y(k,:)=b_spline_boor(P,p,U,U(k));
% end
% plot(X(:,1),X(:,2),'b.',P(:,1),P(:,2),'--ro',Y(:,1),Y(:,2),'sg')
% title('Letra omega curva B-spline: 8 puntos, 12 nodos, grado 3')

clear all;
P=[0 0; 1 0; -0.1 0.5; -0.2 3;1 3;0.25 2; 1.5 1.75; 2.5 2; 2 3;3.2 3; 3.1 0.5; 2 0;3 0];
U=[0 0 0 0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1 1 1];
p=3; % Nodos y grado
t=0:0.001:1;n=size(t,2);
for k=1:n-1
    X(k,:)=b_spline_boor(P,p,U,t(k)); % Calcula el punto C(t(k))
end
for k=5:length(U)-4
    Y(k,:)=b_spline_boor(P,p,U,U(k));
end
plot(X(:,1),X(:,2),'b.',P(:,1),P(:,2),'--ro',Y(:,1),Y(:,2),'sg')
title('Asa, grado 3')

% clear all;
% P=[1 0;0 1; 0.2 2;1 3.1;2 3;3 2;2 0];
% U=[0 0 0 0 0.25 0.5 0.75 1 1 1 1];
% p=3;
% t=0:0.001:1; 
% n=size(t,2);
% for k=1:n-1
% 	X(k,:)=b_spline_boor(P,p,U,t(k));
% end
% for k=4:length(U)-4
% 	Y(k,:)=b_spline_boor(P,p,U,U(k));
% end
% plot(X(:,1),X(:,2),'b.'); hold on
% plot(P(:,1),P(:,2),'--ro'); hold on
% plot(P(:,1),P(:,2),'--ro',Y(:,1),Y(:,2),'sg')
% title('Cuva B-Spline: 7 puntos, 11 nodos, grado 3')

% clear all;
% P=[1 0;0 1;0.2 2;1 3.1;2 3;3 2;2 0];
% U=[0 0 0 0.3 0.5 0.5 0.6 1 1 1];
% p=2;
% t=0:0.001:1;n=size(t,2);
% for k=1:n-1
% 	X(k,:)=b_spline_boor(P,p,U,t(k));
% end
% % Ojo: falta evaluar en t(n)=1
% for k=4:length(U)-3
% 	Y(k,:)=b_spline_boor(P,p,U,U(k));
% end
% plot(X(:,1),X(:,2),'b.');
% hold on
% plot(P(:,1),P(:,2),'--ro',Y(:,1),Y(:,2),'sg')
% title('Cuva B-Spline: 7 puntos, 10 nodos, grado 2')