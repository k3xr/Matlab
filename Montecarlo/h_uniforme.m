% Ejercicio 1
function h_uniforme(n)
hist(rand(n,1),100)
title(sprintf('Histogram of %d uniform random numbers', n))