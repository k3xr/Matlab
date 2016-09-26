function S = paseo(N)
S = zeros(2,N);
for i=2:N
    aleat = 2*pi.*rand(1,N-1);
    S(1,i)=(cos(aleat(1,N-1))+S(1,i-1));
    S(2,i)=(sin(aleat(1,N-1))+S(2,i-1));
end
return
