clear;
x = [-1 1 2 4];
N=4;
xx = x(1)-0.1:0.01:x(end)+0.1;
L = ones(N,length(xx));
color ='rgbkmcyrg';
for i=1:N
    for k=1:N
        if(k==i)
            continue
        else
            L(k,:) =(L(i,:).*(xx-x(k)))./(x(i)-x(k));
        end
    end
end    
for k=(1:N)
    plot(L(k,:),xx,color(k)); hold on
end