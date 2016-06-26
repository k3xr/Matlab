clear all;
P=[1 0;0 1;0.2 2;1 3.1;2 3;3 2;2 0];
U=[0 0 0 0 0.5 0.5 0.5 1 1 1 1];
p=3; % Nodos y grado
t=0:0.001:1;n=size(t,2);
for k=1:n-1
    X(k,:)=b_spline_boor(P,p,U,t(k)); % Calcula el punto C(t(k))
end
for k=5:length(U)-4
    Y(k,:)=b_spline_boor(P,p,U,U(k));
end
plot(X(:,1),X(:,2),'b.',P(:,1),P(:,2),'--ro',Y(:,1),Y(:,2),'sg')