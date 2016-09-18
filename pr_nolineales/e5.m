clear;

R=[0];
gen=1;
while(gen<8)
    RR=zeros(1,4*length(R));
    for k = 1:length(R)
        RR=roots([3 -4*R(k) 0 0 1]);
    end
    
    plot(RR,'ko','MarkerSize',1); hold on;
    set(gca,'Xlim',2*[-1 1],'Ylim',2*[-1 1]);
    
    R = RR;
    
    gen = gen+1;
end
hold off