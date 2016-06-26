function [X] = b_spline_boor_surface(P, U, p, V, q, u, v)
% P -> Puntos de control(matriz)
% U -> Vector de nodos en direccion u
% p -> grado 1
% V -> Vector de nodos en direccion v
% q -> grado 2
% u -> coordenada en u
% v -> coordenada en v

[~,~,~,zz1] = size(P);

for iterv = 1:zz1 % por cada fila de puntos de control
    Q(iterv,:,:) = b_spline_boor_3(P(:,:,:,iterv),q,V,v);
end
X = b_spline_boor_3(Q,p,U,u);

end