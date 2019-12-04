function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

n = length(x);
if isempty(y) ~= n
    error('Both of the required input variables must be same length.')
end

if nargin < 2 || nargin > 2
    error('This function only accepts two input vectors.')
end


if numel(x)>1
   n = numel(x)-1;
   h = (x(end)-x(1))/n;
   h_avg = h/3;
   w_sum = y(1)+2*sum(y(3:2:end-2))+4*sum(y(2:2:end))+y(end);
   I = (h_avg)*(w_sum);    
end

% Trapezoidal Rule code

s = 0;
for i=1:n-1
    x_dif = x(i+1) - x(i);
    y_dif = y(i+1) + y(i);
    s = s + (x_dif*y_dif)/2;
end

end