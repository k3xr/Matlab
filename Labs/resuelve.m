function x=resuelve(A,b,pivotar)
% Resuelve Ax=b con (pivotar=1) o sin (pivotar=0) pivotaje.
if(pivotar)
    [U c]= gauss(A,b,1);
    x=solve_U(U,c);
else
    [U c]= gauss(A,b,0);
    x=solve_U(U,c);
end
return