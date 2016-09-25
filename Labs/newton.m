function out=newton(xi,fi,xx)
% Calcula diferencias divididas a partir de xi e yi 
% Entrada: xi, N abcisas de interpolacion
%          fi, N ordenadas de interpolacion
% Salida:  out, N diferencias divididas

N=length(fi);  DD = zeros(N,N);  % Reservo matriz de Dif Divididas 
DD(:,1) = fi';                   % 1era columna = valores de fi

for k=2:N, %  Barremos columnas de DD (diferencias ordenadas orden k)         
  for j=k:N, % En cada columna k barremos de la diagonal(k) hacia abajo  
    dif =  (DD(j,k-1)-DD(j-1,k-1));  % resta de dif divididas orden k-1
    dx =  xi(j)-xi(j-k+1);           % resta de abscisas
    DD(j,k) =  dif/ dx;              % Diferencia DIVIDIDA
  end
end
    c = diag(DD)';

if nargin ==2
   out = c;  % extraemos la diagonal del triangulo diferencias div
else 
    c = diag(DD)';
    px = c(N);
    for k=N-1:-1:1,
        px = px.*(xx-xi(k))+c(k);
        out = px;
    end
end
return