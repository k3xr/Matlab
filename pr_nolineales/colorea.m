function img=colorea(z,R)
% Entrada:  z matriz 2D de complejos a donde ha ido a parar la malla z0 inicial.
%           R lista de raíces del polinomio en cuestion. 
% Salida:   img matriz 2D de bytes (uint8) del mismo tamaño que z.
%           conteniendo códigos de color: 0, 1, 2, ...

[N M]=size(z);
img=uint8(zeros(N,M));  % Contenedor de imagen (inicializado a 0)

% Dar valores a img
for k=1:length(R);
    cercanos = abs(z-R(k))<0.05; img(cercanos)=k+1;
    lejanos = abs(z)>10; img(lejanos)=1;
end
return
 
 