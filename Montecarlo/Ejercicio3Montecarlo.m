nn = 10000000;
radius = 0.5;
ni = 5;
first = 0;
Xu = rand(nn, 2);
x = linspace(0, radius, ni+1);
h = radius/ni;
x= x(1:ni);
f = sqrt(radius^2-x.^2);
p = f / sum(f);
trueanswer = pi/16;

display('         n estimate error');

mx = zeros(1,7);
my = zeros(1,7);

for i=1:7,
   n = 10^i/2;
   
   npts = round(n*p);
   diff = n-sum(npts);
   if(diff >0)
       npts(1:diff) = npts(1:diff)+1;
   else
       npts(1:-diff) = npts(1:-diff)-1;
   end   
   
   first = 0;
  
   answeris(i) = 0;
   for j=1:ni
       xpts = (j-1)*h+Xu(first+1:first+npts(j))*h;
       answeris(i) = answeris(i) + sum(sqrt(radius^2-xpts.^2))/p(j);
       first = first + npts(j);
   end
   answeris(i) = radius*answeris(i)/(n*ni);
   erroris = abs(answeris(i) - trueanswer);
   
   mx(1,i) = n;
   my(1,i) = answeris(i);
   
   disp(sprintf('%10.0f %f %f ', n, answeris(i), erroris ))
   
end

semilogx(mx,my)
hold on
