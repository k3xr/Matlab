function f=fun8(t, x, y)
g=9.83; %acceleration of gravity (m/sec2)
l=67; %pendulum length (m)
Omega = 2*pi/86400; %Earth s angular velocity of rotation about its axis (rad/sec)
phi = 49/180*pi; %latitude in (rad)

f = 0*y;   
f(1) = 2*Omega*sin(phi)*y(2)-(g/l)*x(1);
f(2) = -2*Omega*sin(phi)*x(2)-(g/l)*y(1);
return