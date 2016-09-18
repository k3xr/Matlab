clear;
%delta = 0.005;
delta = 2e-5;
%rx= -2:delta:2; Nx = length(rx);
rx= 1.17:delta:1.18; Nx = length(rx);
%ry= -2:delta:2; Ny = Nx;
ry= 1.55:delta:1.56; Ny = Nx;
z0 = zeros(Ny, Nx);
for n =1:Ny
    for m = 1:Nx
z0(n,m) = complex(rx(m),ry(n));
    end
end

C = [1 0 0 -1]; % Polinomio a usar = z3-1
for k=1:50,
z0 = iter_newton(C,z0);  % hago una iteración aplicando iter_newton a z0.
%plot(z0,'bo','MarkerSize',2); set(gca,'Xlim',[-2 2],'Ylim',[-2 2]); xlabel('Parte Real'); ylabel('Parte Imag'); % código de antes para pintar la malla z0 tras la iteración.
end

R=roots(C);
img = colorea(z0,R);
imagesc(img);