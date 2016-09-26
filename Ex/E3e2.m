clear;
vcoc=zeros(1,100);
for N=1:100
    A = randn(500,500);
    s = randn(500,1);
    b = A*s;
    x1 = inv(A)*b;
    x2 = A\b;

    dif1 = s-x1;
    dif2 = s-x2;
    vcoc(N) =norm(x1-s)/norm(x2-s);
end
plot([1:100],vcoc);
hold on; plot([1 100],[1 1],'k:');hold off