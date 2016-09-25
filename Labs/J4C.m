clear;
s = 1;temp =1;
for k = 1:29
    temp = temp * k
    if(1/temp < 10^(-18))
        break;
    end
    s = s+1/temp;
end