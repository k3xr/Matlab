% http://geekyisawesome.blogspot.com.es/2013/03/montecarlo-method-of-finding-area-of.html
% number of max sample points
nn = 100000000;

% Radius of the circle
radius = 0.5;

% Real area of 1/4 of circle
trueArea = (pi*radius^2)/4;

% Random sample points (between 0 and radius)
Xu = radius*rand(nn,2);

% points inside the circle
inside = (Xu(:,1).^2 + Xu(:,2).^2 < radius^2);
display('         n  ratio   estimate   error        error*sqrt(n)');

mx = zeros(1,8);
my = zeros(1,8);

for i=1:8
    n = 10^i;
    area = radius^2*sum(inside(1:n))/n;
    error = area - trueArea;
    ratio = sum(inside(1:n))/n;

    mx(1,i) = n;
    my(1,i) = area;
    
    disp( ...
        sprintf('%10.0f %f %f %e %e', ...
            n, ratio, area, error, error*sqrt(n)))
end

semilogx(mx,my)

hold on