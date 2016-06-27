% Ejercicio 2

mx = zeros(1,5);
my = zeros(1,5);

for i=1:5
    
x = 0:0.1^i:0.5; % Cuantos más puntos más precisión
y = sqrt(0.25-x.^2);
z = trapz(x,y);

[m,n] = size(x);

mx(1,i) = n;
my(1,i) = z;

end

semilogx(mx,my)

hold on

% Da lo mismo que pi/16