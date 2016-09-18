clear;
P =poly([1 2 3 4]);
x0 = [0:0.001:5];
x=x0;
for N=1:50
    x=iter_newton(P,x);
end
plot(x0,x,'r.'); hold on;
plot([1 2 3 4],[1 2 3 4],'ko','MarkerFaceColor','k','MarkerSize',6); hold off;
xlabel('Puntos de partida'); ylabel('Puntos de llegada')