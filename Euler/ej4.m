%% 4. Resolver el modelo de los dos edo's con RK4. Dibujar las gráficas en el intervalo [0, 10].
% Dibujar las soluciones en el plano de fases (y1 en una coordenada y y2 en la otra)
h=0.1;

[xn,yn]=metodo_RK4_vec(0,1.2,10,h,'fun4',2); 
plot(yn(1,:), yn(2,:))

figure
[xn,yn]=metodo_RK4_vec(0,2,10,h,'fun4',2); 
plot(yn(1,:), yn(2,:))