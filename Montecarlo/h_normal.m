% Ejercicio 1
function h_normal(n)
hist(randn(n,1),100)
title(sprintf('Histogram of %d normal random numbers', n))