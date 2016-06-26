clear all;

p = 1;
q = 2;
P1 = [0 0 0.5; 0 1 -0.5; 0 2 0.5; 0 3 -0.5; 0 4 0.5];
P2 = [1 0 -0.5; 1 1 0.5; 1 2 -0.5; 1 3 0.5; 1 4 -0.5];

X = P1;
X(:,:,:,2) = P2;

U = [0 0 1 1];
V = [0 0 0 0.5 0.6 1 1 1];

u = 0:0.01:1;
v = 0:0.01:1;

[uF,uC] = size(u);
[vF,vC] = size(v);

for iteradorv = 1:vC-1
    for iteradoru = 1:uC-1
        result(iteradorv,:,:) = b_spline_boor_surface(X,U,p,V,q,u(iteradoru),v(iteradorv));
        plot3(result(:,1),result(:,2),result(:,3),'r');
        hold on;
    end
end

plot3(P1(:,1),P1(:,2),P1(:,3));
hold on;
plot3(P2(:,1),P2(:,2),P2(:,3));
