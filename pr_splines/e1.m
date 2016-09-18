clear;
N=5; ti =[0:N-1]/(N-1); xi = randn(1,N); yi=randn(1,N);
plot(xi,yi,'ro');
hold on;
t = [0:0.005:1];
plot(newton(ti,xi,t),newton(ti,yi,t));
hold off;