function dx = focaultPendulum(t,x)
%define your constants
lat = 0*pi/180;
g = 9.81;
L = 5;
Omega = 7.27*10^-5;
dx = zeros(4,1);
dx(1) = x(3);
dx(2) = x(4);
dx(3) = 2*(Omega)*x(4)*sin(lat) - (g/L)*x(1);
dx(4) = -2*(Omega)*x(3)*sin(lat) - (g/L)*x(2);
end