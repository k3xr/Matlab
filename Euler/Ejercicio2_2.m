clear
h=0.1;
for i = 1:160 
    [xn,yn]=metodo_E(0,i,20,h,'fun2');
    if i == 140
        plot(xn,yn,'r');
    else
        plot(xn,yn,'b');
    end
    hold on
end