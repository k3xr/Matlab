function x=solve_U(U,b)
% Resuelve el sistema triangular superior Ux=b y devuelve la solucion en x
N=length(b); x=NaN*zeros(N,1);  % Reservo espacio para vector solución x
for r=N:-1:1,
    S=0; for k=r+1:N, S=S+U(r,k)*x(k); end   % Calculo sumatorio
    x(r)=(b(r)-S)/U(r,r);  %Divido por el término de la diagonal
end
return
