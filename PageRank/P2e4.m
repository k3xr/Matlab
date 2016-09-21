clear
clc
i=1;
pl =ones(6,1);
while (1)
    fprintf('ITERACION %i ----------------------- \n',i);
    N=10^i;
    [S]=preparacion_potencia_dispersa(N);
    tic
    [lambda,v,iter]=potencia(S);
    t=toc;
    [user sys] = memory;
    pl(i,1)= t;
    fprintf('memoria usada = %i bytes \n',user.MemUsedMATLAB);
    fprintf('tiempo iteracion %i = %.16f segundos \n',i,t);
    fprintf('numero iteraciones = %i \n',iter);
    fprintf('precision Sx-lambdax = %.5e \n',norm(S*v-lambda*v));
    fprintf('precision lambda-1 = %.5e \n',norm(lambda-1));
    i=i+1;
    t=0;
end
