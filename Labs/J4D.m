clear;
s = 1;temp =1;
for k =1:29
    while (1/temp > 10^(-18))
    temp = temp * k;
    s = s+ 1/temp;
    end
end
