function s=spline3(tn,fn,t)
% Interpolaci�n con un spline c�bico 
% Asume puntos equiespaciados tn(2)-tn(1) = tn(3)-tn(2) = � = h
% Entrada:  vector tn y vector fn de tama�o 1xN con los nodos a interpolar
%           vector t (1xM) con los puntos donde evaluar el spline c�bico	                
%
% Salida:   s = vector del mismo tama�o de t, con los valores del spline.

fn=fn'; % Paso a vector columna para facilitar c�digo posterior. 

%%%% PRIMERA PARTE
%%%% Calculo de los vectores M y C conteniendo los correspondientes
%%%% coeficientes del spline c�bico para todos los intervalos

% Determinar numero puntos N y espaciado h
N=length(tn);
h= abs(tn(2)-tn(1));
% Construir vector F (tama�o N-2)
F=NaN*zeros(N-2,1);
for i= 3:N
    F(i-2)= (fn(i)-2.*fn(i-1)+fn(i-2));
end
% Resolver el sistema tridiagonal para encontrar M's y completar con 0's
a=4*ones(1,N-2); b=ones(1,N-3);
H=diag(a,0)+diag(b,1)+diag(b,-1);
M=H\F;

M =[ 0; M; 0];
% Calcular coeficientes C
C=(fn-M);
%%%% SEGUNDA PARTE:   
%%%% Conocidas constantes M y C, calcular spline en los puntos t dados

s = t*NaN;  % vector salida (mismo tama�o que el vector t de entrada)

for k=1:length(t)  % bucle asignando valores a cada s(t)
    tt =(t(k)-tn(1))/h;
    index = floor(tt);
    u = tt-index;
    
    index=index+1;
    
    if(u==0)
        s(k)= fn(index);
    else
        s(k)= (M(index)*(1-u)^3)+M(index+1)*u^3+C(index)*(1-u)+C(index+1)*u;
    end
end

return
