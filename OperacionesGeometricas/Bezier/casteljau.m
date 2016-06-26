function p = casteljau(c,t)
% CASTELJAU: de Casteljau's algorithm for Bezier curves 
% p = casteljau(c,t)
% points p(j,:) on a Bezier curve with control points c(k,:)
% for parameters t(j) 

% convert to column vector (if necessary)
t = t(:); 
 
[np1,dim] = size(c);
% de Casteljau's recursion 
if np1 == 1
   p = (1+0*t)*c;
else
   p0 = casteljau(c(1:end-1,:),t); 
   p1 = casteljau(c(2:end,:),t); 
   t = repmat(t,1,dim); 
   p = (1-t).*p0 + t.*p1;
end
