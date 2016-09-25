clear;
x = rand(1,10000);
S1 = zeros(1,10000);
S2 = single(S1);
for n= 1:10000;
    S1(1,n) = sum(x(1,n));
    S2(1,n) =single(sum(x(1,n)));
end
v=S1-S2;
semilogx(v);