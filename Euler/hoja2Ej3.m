% clear
% h=1/10;
% l=67; %pendulum length (m)
% [xn,yn]=metodo_RK4_vec(0,10,20,h,'fun8');
% plot(xn,yn(1,:),'.');
% hold on


[T,Y] = ode45('focaultPendulum',[67/100, 0],[67/100 0 0 0]);
L = 10;
for a = 1:length(T);
  plot([0 Y(1,1)],[0 Y(1,2)],'r-','LineWidth',2);
  hold on;
  plot([0 Y(a,1)],[0 Y(a,2)],'o:','MarkerFaceColor','b','Markersize',10)
  hold on;
  xlim([-2 2])
  ylim([-2 2])
  pause(0.05)
end