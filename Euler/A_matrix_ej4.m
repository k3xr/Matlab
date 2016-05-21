function x = A_matrix_ej4(t)

% 5 pasos, tamano de paso h = 0.1
% desde j=1 hasta n-1
% yj+1(tj+h)+yj(-2tj)+yj-1(tj-h) = 4h

n =length(t);

for j=2:n-1
    A_full(j-1,j-1) = t(j-1);
    A_full(j-1,j) = -2*t(j);
    A_full(j-1,j+1) = t(j+1);
    
end
x = A_full(1:n-2,2:n-1);

end