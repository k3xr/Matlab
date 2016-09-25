clear;
v = zeros(1,1000);
for i = 1:1000;
    v(1,i) = collatz(i);
end
plot(v);