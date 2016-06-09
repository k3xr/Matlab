clear all;
h = 0.1; %tama�o de paso
t=0.5:h:1;
n = length(t); % 6
b_side(2:n-1) = 4*h*h; % los que est�n rellenos son los que se van a usar
b_side(2)=4*h*h-3/2;
b_side(n-1)=4*h*h-3; % tambien se podria poner b_side(n-1)=4*h*h-(3*t(6));
A = A_matrix_ej4(t);
b = b_side(2:n-1);
y=A\b';
t_base=0.5:h/10:1;
plot(t_base,2*t_base+1./t_base,t(2:5),y,'+');