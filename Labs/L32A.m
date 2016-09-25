clear; n = 10000; m = zeros(2,n);
for i=2:n
    m(:,i)=randn(2,1)+m(:,i-1);
end
plot(m(1,:),m(2,:))