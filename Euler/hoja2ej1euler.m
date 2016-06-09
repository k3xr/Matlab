clear
h=0.01;
[xn,yn]=metodo_E_vectorizado(1,[4,1.5],2,h,'fun5');
plot(xn,yn(1,:),'.b');

% plot(xn,yn(2,:),'b'); % esto pintaria la derivada
hold on

[xn,yn]=metodo_E_vectorizado(1,[4,2],2,h,'fun5');
plot(xn,yn(1,:),'.r');
hold on

[xn,yn]=metodo_E_vectorizado(1,[4,1.31],2,h,'fun5');
plot(xn,yn(1,:),'.g');
hold on

[xn,yn]=metodo_E_vectorizado(1,[4,1.4],2,h,'fun5');
plot(xn,yn(1,:),'.m');
hold on