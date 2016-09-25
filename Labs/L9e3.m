clear;
C=zeros(1,10);
Erel=zeros(1,10);
R=zeros(1,10);
for n=1:10
   H=hilb(n);
   C(1,n)=cond(H);
   
   s=ones(n,1);
   b = H*s;
   x = H\b;
   Erel(n)= norm(x-s)/norm(s);
   R(n)=norm(H*x-b)/norm(b);
   %fprintf('valor de n: %2d condicionamiento: %.2e logaritmo en base 10: %.0f \n',n,C(1,n),log10(C(1,n)));
  
   
end
%plot([1:10],16-log10(C),'r',[1:10],-log10(Erel),'b')
semilogy([1:10],R,'r',[1:10],-log10(Erel),'b')
