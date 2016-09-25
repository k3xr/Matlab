clear;
N=8;
xi = 200 + [0:N-1]';
fi = randn(N,1);

xx = [xi(1):0.01:xi(end)];

H = [xi.^0 xi.^1 xi.^2 xi.^3 xi.^4 xi.^5 xi.^6 xi.^7];
C = H\fi;
%err1 = max(abs(H*C - fi));
plot(xi,fi,'ko',xx,polyval(C(end:-1:1),xx),'g') ;hold on
hold on;
plot(xx,newton(xi,fi,xx),'b');
%err2 = max(abs(fi2-fi));