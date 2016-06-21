function X = c_bezier_casteljau(P, t)
% Las variables de entrada son P el conjunto de puntos de control y t el parámetro, 
% la variable de salida es X=C(t) el valor de la curva de Bezier en el punto t.

[n,m,z] = size(P);
Q = P;
for k = 1:n
   for i = 0:n-k-1
        Q(i+1,:) = (1-t).*Q(i+1,:)+t.*Q(i+2,:);
   end
end
X=Q(1,:);