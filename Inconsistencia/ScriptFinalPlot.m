clear all
clc

n=4;

%Inicializamos el vector w
w = rand(1,n);
%Normalizamos para que la suma sea del vector sea 1
suma = sum(w);
w = w./suma;

vectorErrores1 = zeros([9,4]);
vectorErrores2 = zeros([9,4]);

iteracionBucle = 1;

for k=10:10:90    
    
    [vectorMatrices,vectorErrores,vectorCI] = GeneraciondeM(w, n, k, 100);
    vectorErrores1(iteracionBucle,:)= vectorErrores(1,:);
    vectorErrores2(iteracionBucle,:)= vectorErrores(2,:);
    
    iteracionBucle = iteracionBucle+1;
    
end

gradoInconsistk = [10,20,30,40,50,60,70,80,90];

subplot(2,1,1);
hold on
title('Errores vs Grado de inconsistencia (k)')
xlabel('k, Grado de inconsistencia');
ylabel('Error Relativo');
plot(gradoInconsistk,vectorErrores1(:,1), 'g:');
plot(gradoInconsistk,vectorErrores1(:,2), 'r');
plot(gradoInconsistk,vectorErrores1(:,3), 'black');
plot(gradoInconsistk,vectorErrores1(:,4),'b');
hold off
%plot(gradoInconsistk,vectorErrores2(:,1));

subplot(2,1,2);
hold on
xlabel('k, Grado de inconsistencia');
ylabel('Error Promedio');
plot(gradoInconsistk,vectorErrores2(:,1), 'g:');
plot(gradoInconsistk,vectorErrores2(:,2), 'r');
plot(gradoInconsistk,vectorErrores2(:,3), 'black');
plot(gradoInconsistk,vectorErrores2(:,4),'b');
hold off
%plot(gradoInconsistk,vectorErrores2(:,1));