% GENERACION DE DATOS 3D (matriz 3 x Npuntos) a pintar
L=25; N=2*L+1;
X=ones(N,1)*[-L:L]/L;
Y=[-L:L]'*ones(1,N)/L;
Z=peaks(N)/4;
XYZ=[ reshape(X,1,N*N) ; reshape(Y,1,N*N); reshape(Z,1,N*N)];

plot3(XYZ(1,:),XYZ(2,:),XYZ(3,:),'r');

X0 = [-4 4 4]'; % Posicion observador
target=[0 0 0]'; % Target
up=[0 0 1]'; % Vector up
ang=15; % Angulo de visión.
campos(X0); camtarget(target); camup(up); camva(ang);
camproj('perspective');
set(gca,'Pos',[0.0 0.0 1.0 1.0],'DataAspectRatio',[1 1 1]);
axis off