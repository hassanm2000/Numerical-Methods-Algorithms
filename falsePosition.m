function [root, fx, ea, iter] = falsePosition(f, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method

f = @(x) x.^3 + 2*x +3;
fx = f;
xl = input('Enter a number for your lower bound:\n');
xu = input('Enter a value for your upper bound:\n');
es = 0.0001;
maxit = 200;
xr = xu - (f(xu)*(xl-xu))/(f(xl)-f(xu));

xr = xl;
ea = 100;
iter = 0;
while (1)
    xr_old = xr;
    xr = xu - (f(xu)*(xl-xu))/(f(xl)-f(xu));
    iter = iter+1;
    if xr ~= 0, ea = abs((xr-xr_old)/xr)*100;
    end
if f(xr) == 0
    disp('This value of xr is the root of your function.')
elseif f(xr)*f(xl) < 0
    xu = xr;
elseif f(xr)*f(xl) < 0
    xl = xr;
else
    ea = 0;
    if ea <= es || iter > maxit,break,end
end
root = xr; fx = f(xr,varagin{:});
end
