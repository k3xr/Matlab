function L=collatz(n)
L=1;
k=n;
while k ~= 1
    if(mod(k,2) == 0);
        k = k/2;
    else
        k = 3*k+1;
    end
    L = L+1;
end
return