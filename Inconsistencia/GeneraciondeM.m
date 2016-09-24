%Método para generar vector w de pesos aleatorio
function [vectorMatrices,vectorErrores,vectorCI] = GeneraciondeM(w, n,k, nMatrices)

%Parametro de salida, array multidimensional
vectorMatrices = zeros([n,n, nMatrices]);
%errores: Fila1 = relativo
%         Fila2 = promedio
vectorErrores = zeros([2, 4]);
vectorErrRelMet1= zeros([1, nMatrices]);
vectorErrRelMet2= zeros([1, nMatrices]);
vectorErrRelMet3= zeros([1, nMatrices]);
vectorErrRelMet3bis= zeros([1, nMatrices]);
vectorErr2Met1= zeros([1, nMatrices]);
vectorErr2Met2= zeros([1, nMatrices]);
vectorErr2Met3= zeros([1, nMatrices]);
vectorErr2Met3bis= zeros([1, nMatrices]);
vectorCI = zeros([1, nMatrices]);

%Inicializamos
W = zeros([n,n]);
%Calculamos W
for i=1:1:n
    for j=1:1:n
        W(i,j)=w(i)/w(j);
    end
end

%Calculamos la parte alta y baja de la matriz
%M será nuestra matriz perturbada, inicializada a 1's para mantener
%la diagonal y solo tener que modificar la parte alta y baja de M
M = ones(size(W)); %Inicialización de M matriz perturbada
desplazamiento = 0;
%Vector de matrices
for indice=1:1:nMatrices
    %Rellena filas
    for i=1:1:n
        z=i+1;
        %Rellena columnas
        for j=1:1:n
            if z>n
                break;
            end
            %Parte alta, sumamos desde lo mas bajo del intervalo y vamos
            %incrementando (mas adelante)
            rangoElemento = (((100+k)/100)*W(i,z))-(((100-k)/100)*W(i,z));
            salto = rangoElemento/nMatrices;
            %El salto será siempre el mismo para cada elemento de cada
            %matriz por que se obtienen de W por lo que debemos multiplicar
            %por el número de desplazamientos (nº de la matriz que estamos
            %generando.
            M(i,z)=(((100-k)/100)*W(i,z))+salto*desplazamiento;
            %Parte baja de la matriz (debe ser reciproca).
            M(z,i)= 1/M(i,z);
            %Incrementamos z solo necesaria para saltar el primer elemento
            %de la matriz y no escribir en la diagonal.
            z = z+1;
        end
    end
    %Introducimos la matriz a nuestro vector de matrices.
    vectorMatrices(:,:,indice)= M(:,:);
    


    %Despues de la perturbacion
    %Calculamos usando el metodo 1 de la potencia.
    [lambda, x1,iter] = potencia(M); %Codigo de la potencia en el ANEXO

    %Calculamos Wx1 matriz asociada al vector de pesos del metodo 1
    Wx1 = zeros([n,n]);
    for i=1:1:n
        for j=1:1:n
            Wx1(i,j)=x1(i)/x1(j);
        end
    end

    %Calculamos usando el metodo 2.
    [x2] = metodo_2(M);


    %Calculamos Wx4 matriz asociada al vector de pesos del metodo 2
    Wx2 = zeros([n,n]);
    for i=1:1:n
        for j=1:1:n
            Wx2(i,j)=x2(i)/x2(j);
        end
    end

    %Calculamos usando el metodo 3.
    [x3] = metodo_3(M);

    %Calculamos Wx4 matriz asociada al vector de pesos del metodo 3
    Wx3 = zeros([n,n]);
    for i=1:1:n
        for j=1:1:n
            Wx3(i,j)=x3(i)/x3(j);
        end
    end


    %Calculamos usando el metodo 3 bis.
    [x4] = metodo_3bis(M);

    %Calculamos Wx4 matriz asociada al vector de pesos del metodo 3 bis
    Wx4 = zeros([n,n]);
    for i=1:1:n
        for j=1:1:n
            Wx4(i,j)=x4(i)/x4(j);
        end
    end


    %Calculamos el IC, con el que comprobaremos que si aumentamos
    %la perturbacion aumenta la inconsistencia.
    CI = abs((n-lambda)/(n-1));
    vectorCI(indice)= CI;

    %Calculamos los errores absolutos para llevar a cabo el calculo del error relativo
    R1 = abs(M-Wx1);
    %Metodo 2 de la potencia
    R2 = abs(M-Wx2);
    %Metodo 3 de la potencia
    R3 = abs(M-Wx3);
    %Metodo 3 bis de la potencia
    R4 = abs(M-Wx4);

    %Errores relativos de cada metodo
    errelR1 = R1./M;
    errelR2 = R2./M;
    errelR3 = R3./M;
    errelR4 = R4./M;

    errelR1_2 = (1/n)*power((sum(power(errelR1,2))),1/2);
    vectorErrRelMet1(1,indice)= errelR1_2(2);
    errelR2_2 = (1/n)*power((sum(power(errelR2,2))),1/2);
    vectorErrRelMet2(1,indice)= errelR2_2(2);
    errelR3_2 = (1/n)*power((sum(power(errelR3,2))),1/2);
    vectorErrRelMet3(1,indice)= errelR3_2(2);
    errelR4_2 = (1/n)*power((sum(power(errelR4,2))),1/2);
    vectorErrRelMet3bis(1,indice)= errelR4_2(2);
    
    err2_1 = (sum(sum(R1)))/(n*n);
    err2_2 = (sum(sum(R2)))/(n*n);
    err2_3 = (sum(sum(R3)))/(n*n);
    err2_4 = (sum(sum(R4)))/(n*n);
    vectorErr2Met1(1,indice)= err2_1;
    vectorErr2Met2(1,indice)= err2_2;
    vectorErr2Met3(1,indice)= err2_3;
    vectorErr2Met3bis(1,indice)= err2_4;
    
    %Incrementamos el desplazamiento.
    desplazamiento=desplazamiento+1;

end
%Error Promedio de cada metodo
vectorErrores(1,1)=sum(vectorErrRelMet1)/nMatrices;
vectorErrores(1,2)=sum(vectorErrRelMet2)/nMatrices;
vectorErrores(1,3)=sum(vectorErrRelMet3)/nMatrices;
vectorErrores(1,4)=sum(vectorErrRelMet3bis)/nMatrices;
vectorErrores(2,1)=sum(vectorErr2Met1)/nMatrices;
vectorErrores(2,2)=sum(vectorErr2Met2)/nMatrices;
vectorErrores(2,3)=sum(vectorErr2Met3)/nMatrices;
vectorErrores(2,4)=sum(vectorErr2Met3bis)/nMatrices;
end