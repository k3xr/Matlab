% GENERACION DE DATOS 3D (matriz 3 x Npuntos) a pintar
L=25; N=2*L+1;
X=ones(N,1)*[-L:L]/L;
Y=[-L:L]'*ones(1,N)/L;
Z=peaks(N)/4;
XYZ=[ reshape(X,1,N*N) ; reshape(Y,1,N*N); reshape(Z,1,N*N)];

% Visualizacion del grafico 3D
figure(1)
plot3(XYZ(1,:),XYZ(2,:),XYZ(3,:),'r');
% Parametros de visualizacion
X0 = [-4 4 4]'; % Posicion observador
target=[0 0 0]'; % Target
up=[0 0 1]'; % Vector up
ang=15; % Angulo de vision.
campos(X0); camtarget(target); camup(up); camva(ang);
camproj('perspective');
set(gca,'Pos',[0.0 0.0 1.0 1.0],'DataAspectRatio',[1 1 1]);
axis off

%% Parte obligatoria
% 1. Creacion de las coordenadas homogeneas
W = ones(1,size(XYZ,2));
XYZW = [XYZ; W];

% 2. Creacion de la matriz M (T*R*S)
M = diag([1, 1, 1, 1]); % Matriz identidad de 4x4

% 3. Generacion de la matriz V
n = -(target-X0);
n = n/norm(n); % Normalizacion de n
u = cross(up, n); % Producto vectorial de up x n
u = u/norm(u); % Normalizacion de u
v = cross(n, u); % Producto vectorial de n x u
R = [u v n]'; % Matriz R de 3x3
V = [R, -R*X0; zeros(1,3), 1]; % Matrix cambio de punto de vista

% 4. Generacion de la matriz de proyeccion P
relAspec = 4/3;
n=1; f=15;
rad = degtorad(ang);

P = zeros(4,4);
P(1,1) = 1/(relAspec*tan(rad/2));
P(2,2) = 1/tan(rad/2);
P(3,3) = -((f+n)/(f-n));
P(3,4) = -(2*f*n)/(f-n);
P(4,3) = -1;

% 5. Calcular la matriz Q
Q = P*V*M;
Coords = Q*XYZW;

% 6. Obtencion del las coordendas 3D normalizadas
Fila1Norm = Coords(1,:)./Coords(4,:);
Fila2Norm = Coords(2,:)./Coords(4,:);
Fila3Norm = Coords(3,:)./Coords(4,:);
Coords3D = [Fila1Norm;Fila2Norm;Fila3Norm];

% 7. Pintar las coordenadas normalizadas
figure(2)
plot(Coords3D(1,:), Coords3D(2,:))
set(gca,'Xlim',[-1 1],'Ylim',[-1 1])
set(gca,'Pos',[0.0 0.0 1.0 1.0]); axis off

% Movimiento de la camara
D = 8/sqrt(2);
for t=0:0.005:2 % Variamos posicion observador en el tiempo t
    X0 = [D*cos(2*pi*(t+3/8)) D*sin(2*pi*(t+3/8)) 4]';
    campos(X0);
    pause(0.01);
end

%% Parte Opcional
figure(3)
% surf(XYZ)
plot3(XYZ(1,:), XYZ(2,:), XYZ(3,:))

% Parametros de visualizacion
X0 = [-4 4 4]'; % Posicion observador
target=[0 0 0]'; % Target
up=[0 0 1]'; % Vector up
ang=15; % Angulo de vision.
campos(X0); camtarget(target); camup(up); camva(ang);
camproj('perspective');
set(gca,'Pos',[0.0 0.0 1.0 1.0],'DataAspectRatio',[1 1 1]);
axis off

zn = reshape(Coords(4,:), 51, 51); % Coordenada normalizada
colorbar(); % Barra con el codigo de colores usado

% Movimiento de la camara
D = 8/sqrt(2);
for t=0:0.005:2 % Variamos posicion observador en el tiempo t
    X0 = [D*cos(2*pi*(t+3/8)) D*sin(2*pi*(t+3/8)) 4]';
    s = (sin(t)+0.5)*10;
    % 1. Creacion de las coordenadas homogeneas
    W = ones(1,size(XYZ,2));
    XYZW = [XYZ; W];
    
    % 2. Creacion de la matriz M (T*R*S)
    M = diag([s, s, s, 1]); % Matriz identidad de 4x4
    
    % 3. Generacion de la matriz V
    n = -(target-X0);
    n = n/norm(n); % Normalizacion de n
    u = cross(up, n); % Producto vectorial de up x n
    u = u/norm(u); % Normalizacion de u
    v = cross(n, u); % Producto vectorial de n x u
    R = [u v n]'; % Matriz R de 3x3
    V = [R, -R*X0; zeros(1,3), 1]; % Matrix cambio de punto de vista
    
    % 4. Generacion de la matriz de proyeccion P
    relAspec = 4/3;
    n=1; f=15;
    rad = degtorad(ang);
    
    P = zeros(4,4);
    P(1,1) = 1/(relAspec*tan(rad/2));
    P(2,2) = 1/tan(rad/2);
    P(3,3) = -((f+n)/(f-n));
    P(3,4) = -(2*f*n)/(f-n);
    P(4,3) = -1;
    
    % 5. Calcular la matriz Q
    Q = P*V*M;
    Coords = Q*XYZW;
    
    % 6. Obtencion del las coordendas 3D normalizadas
    Fila1Norm = Coords(1,:)./Coords(4,:);
    Fila2Norm = Coords(2,:)./Coords(4,:);
    Fila3Norm = Coords(3,:)./Coords(4,:);
    Coords3D = [Fila1Norm;Fila2Norm;Fila3Norm];
    
    % 7. Pintar las coordenadas normalizadas
    plot(Coords3D(1,:), Coords3D(2,:))
    set(gca,'Xlim',[-1 1],'Ylim',[-1 1])
    set(gca,'Pos',[0.0 0.0 1.0 1.0]); axis off
    campos(X0);
    pause(0.01);
end