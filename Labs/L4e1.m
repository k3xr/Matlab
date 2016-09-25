clear;
x = zeros(1,21);
for n = 0:20;
    x(1,n+1) = 10.^(-n);
end
sinh1 = (exp(x)-exp(-x))/2;
ok = sinh(x);
eabs = abs(ok-sinh1);
erel = eabs./abs(ok);
semilogy(erel); xlabel('n');
hold on;
semilogy(eps(sinh1));