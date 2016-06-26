function val = b_spline_boor_3(P,grado,U,t)
% P -> conjunto de puntos de control
% grado -> grado del B-Spline
% U -> conjunto de nodos
% t -> parametro
% X = C(t) -> valor de la curva B-Spline en el punto t

grado = grado+1;

Xi = zeros(grado,grado);
Yi = zeros(grado,grado);
Zi = zeros(grado,grado);

% calculamos K
id = find(t >= U);
k = id(end);

Xi(:,1) = P(k-grado+1:k,1);
Yi(:,1) = P(k-grado+1:k,2);
Zi(:,1) = P(k-grado+1:k,3);

for r = 2:grado
    for i = r:grado
        a = (t-U(k-grado+i))/(U(k+i-r+1)-U(k-grado+i));
        Xi(i,r) = (1-a)*Xi(i-1,r-1) + a*Xi(i,r-1);
        Yi(i,r) = (1-a)*Yi(i-1,r-1) + a*Yi(i,r-1);
        Zi(i,r) = (1-a)*Zi(i-1,r-1) + a*Zi(i,r-1);
    end
end
val = [Xi(grado,grado), Yi(grado,grado), Zi(grado,grado)];
end