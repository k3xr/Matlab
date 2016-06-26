% GENERACION DE DATOS 3D (matriz 3 x Npuntos) a pintar
L=25; N=2*L+1;
X=ones(N,1)*[-L:L]/L;
Y=[-L:L]'*ones(1,N)/L;
Z=peaks(N)/4;
% Creamos coordenadas homogéneas (cuarta fila llena de 1s)
Row4=ones(N);
XYZ=[ reshape(X,1,N*N) ; reshape(Y,1,N*N); reshape(Z,1,N*N); reshape(Row4,1,N*N)];
% Creamos la matriz M (escalado/giro/translacion), la matriz identidad
M = eye(4);
% Generamos matriz V del cambio de punto de vista
X0 = [-4 4 4]'; % Posicion observador
target = [0 0 0]'; % Target
up = [0 0 1]'; % Vector up
n = -(target-X0);
n = n/norm(n);
u = cross(up,n);
u = u/norm(u);
v = cross(n,u);
R = [u';v';n'];
lastRow = [0,0,0,1];
V = [R, -R*X0; lastRow];
% Generamos matriz de proyección P
ang = 15; % Angulo de visión.
relAspecto = 4/3; % Relacion de aspecto
f1 = 15;
n1 = 1;
P = [1/(relAspecto*tan(ang/2)),0,0,0;
    0,1/(tan(ang/2)),0,0;
    0,0,-((f1+n1)/(f1-n1)),-((2*f1*n1)/(f1-n1));
    0,0,-1,0];
% Calculamos producto Q
Q = M*V*P;
% aplicamos q a todas las coordenadas homogéneas
Coords = Q * XYZ;
% obtenemos las coordenadas 3D normalizadas
Fila1Norm = Coords(1,:)./Coords(4,:);
Fila2Norm = Coords(2,:)./Coords(4,:);
Fila3Norm = Coords(3,:)./Coords(4,:);
CoordsNorm = [Fila1Norm;Fila2Norm;Fila3Norm];

plot(Fila1Norm,Fila2Norm);
set(gca,'Xlim',[-1 1],'Ylim',[-1 1])
set(gca,'Pos',[0.0 0.0 1.0 1.0]); axis off