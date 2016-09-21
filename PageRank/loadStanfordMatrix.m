function A=loadStanfordMatrix;

load spal_004;
A=spconvert(spal_004);
% make the matrix square
n=max(size(A));
A(n,n)=0;
% take the transpose A^T (which is what we multiply by)
A=A';