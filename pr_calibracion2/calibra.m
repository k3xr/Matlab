function M=calibra(pix,utm)
% Entrada:  
% pix: matriz N x 2 con la posicion en pixeles de los N ptos de control
%      la primera columna son las X's y la segunda las Y's
% utm: matriz N x 2 con las coordenadas UTM de los N ptos de control 
%      la primera columna son las E's y la segunda las N's
%
% Salida:
%   M : matriz 3 x 2 con los coeficientes de la transformación de pixeles 
%       coordinadas:
%                          a  b  E0
%                          c  d  N0

M = [1 0 0 
     0 1 0];  % Matriz por defecto (no transforma nada)

N = size(pix,1); % Numero de puntos de control
  
if (N<3), 
    fprintf('No se puede ajustar con menos de 3 puntos\n'); 
    return; 
end

% Crear la matriz H (comun a ajuste E y N)

H=[pix(:,1) pix(:,2) pix(:,1).^0];

% Resuelve ajuste en X (Este )  E = a*X + b*Y + E0 
b=[utm(:,1)];
E=H\b;

% Calcula residuos Este
rE=b-H*E;
  
% Resuelve ajuste en Y (Norte)  N = c*X + d*Y + N0 
 
b2=[utm(:,2)];
N=H\b2;

% Calcula residuos Norte  
rN=b2-H*N;
  
% Crea matriz M a partir de parametros de ajuste obtenidos  

M=[E';N'];
  
% Vuelca la matriz M con fprintf
  fprintf('Matriz de transformación M:\n')
  fprintf('%5.2f %5.2f %10.2f\n ',M');

  
% Vuelca los datos de los residuos Este y Norte  
  fprintf('Residuo Este:\n'); 
  fprintf('%.1f %.1f %.1f %.1f %.1f %.1f %.1f ',rE'); 
  fprintf('\nResiduo Norte:\n'); 
  fprintf('%.1f %.1f %.1f %.1f %.1f %.1f %.1f ',rN'); 
  fprintf('\n');
  return
  