function xx = bez_code(P)
% Calcula la curva de Bezier para los puntos de control dados en las
% columnas de P.
% La salida es una matriz de 2 filas con las coordenadas de la curva 
% La primera fila son las  X's y la segunda las Y's 

orden=size(P,2)-1;  % Orden = número puntos -1 = columnas(P) -1

t=[0:0.001:1];   % Base de tiempo de t=0 (inicio) a t=1 (fin)
L=length(t); ct = (1-t);  
xx=NaN(2,L);  % Al principio xx está vacio (NaN) 

switch orden   % Segun orden rellenamos xx 
  case 1,
   xx = P(:,1)*(ct) + P(:,2)*t;      
  case 2,
   xx = P(:,1)*(ct.^2) + 2*P(:,2)*(t.*(ct)) + P(:,3)*(t.^2);         
  case 3,  

  case 4,    
  
  case 5,  
    
end    
 

return