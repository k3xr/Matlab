clear all
clc
N=5;
A=rand(N);
comprEstocastica=0;

for X=1:N;
    A(:,X) = A(:,X)/sum(A(:,X)); %reescalar
    if(round(sum(A(:,X)))~=1) %Columnas suman 1(Comprobacion estocastica)
        comprEstocastica=-1;
    end
end

%La matriz A es no negativa ya que ha sido generada con rand que nunca da
%negativos
display(comprEstocastica); % si comprEstocastica=-1 => no estocastica