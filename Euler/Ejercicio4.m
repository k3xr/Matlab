h=0.1;

[xn,yn]=metodo_RK4_vec(0,1.2,10,h,'fun4',2); 
plot(yn(1,:), yn(2,:));
hold on;

[xn,yn]=metodo_RK4_vec(0,2,10,h,'fun4',2); 
plot(yn(1,:), yn(2,:))