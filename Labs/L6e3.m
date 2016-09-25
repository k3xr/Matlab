clear;
xx = -1:0.01:1;
ff=fun(xx);
for k=1:4
    N = 2^k;
    xi = -1 + 2*[0:N-1]/(N-1);
    fi = fun(xi);
    pp=newton(xi,fi,xx);
    subplot(2,2,k);
    plot(xi,fi,'ko'); hold on;
    plot(xx,ff,'b');
    plot(xx,pp,'r'); hold off;
    discr = max(abs(ff-pp));
    fprintf('usando %d puntos -> max. diferencia= %8f\n' ,N,discr);
end