function [U c]=gauss(A,b, pivotar)
%Eliminación de Gauss sin pivote.  Ax=b  =>  Ux=c

N = length(b); %Tamaño datos
A = [A b]; % Pego vector b a la matriz A para hacer las mismas operaciones
for col=1:N-1,  % recorro columnas de 1 a N-1 de la matriz A
    % Lugar para introducir código pivotaje
    
    if(pivotar)
        candidatos = A(col:N,col);
        [~, index] = max(abs(candidatos));
        index=col+index-1;
        
        if(index~=col)
            t = A(col,:);
            A(col,:)=A(index,:);
            A(index,:)=t;
        end
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    pivote = A(col,col);    % Pivote = elemento de la diagonal
    for k=col+1:N,       % Recorro filas (k's) por debajo de diagonal
        m = A(k,col)/pivote;  % Cociente entre 1er elemento fila y pivote
        for j=col:N+1,        % Fila(k) = Fila(k) - m x fila(col)
            A(k,j)=A(k,j)-m*A(col,j); % (desde columna col -> N)
        end
    end
end
U = A(:,1:N);     % Separo matriz triangular final
c = A(:,N+1:end); % Separo Vector c del sistema Ux=c equivalente
return
