function [S] = preparacion_potencia_dispersa(N)

r = randi(100, 3, 5);
p = randi(N, 1, 10*N);
q = randi(N, 1, 10*N);
S = sparse(p,q, 1, N, N);
for x=1:N
    if (sum(S(:,x)) == 0)
        S(:,x)=1/N;
    else
        S(:,x) = S(:,x)/sum(S(:,x));
    end
end

return