clear;
N = 500;
A = randn(N,N);
s = randn(N,1);
b = A*s;
tic; x1=A\b; toc ;dif1 = x1-s;
tic; x2=resuelve(A,b,1); toc ;dif2 = x2-s;

m1=mean(abs(dif1)); m2=mean(abs(dif2));  % Medias (abs) de discrepancias
fprintf('Media errores para matriz A de tamaño %d\n',N),
fprintf('Matlab: %.2e\nGauss con pivotaje: %.2e\n',m1,m2);
 % Dibujamos los residuos de los 2 métodos
nn=[1:N];  plot(nn,dif1,'g',nn,dif2,'r');  
legend('Matlab','Gauss con piv'); title('Componentes (x-s)')
