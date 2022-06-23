%function x = M_20220119cmpsc456hw1newton(x0,f,tol)

% x0 is initial guess
% tol is tolerance
% x0 is initial guess(-5,-4)

tol=10^-9;
dx=1.0;


syms h(x1,x2)
h(x1,x2)= x1.^2-x2.^2+2.*x2;
syms g(x1,x2)
g(x1,x2)= 2.*x1+x2.^2-6;
% 2 equation
syms J(x1,x2)
J(x1,x2)=[diff(h,x1) diff(h,x2);diff(g,x1) diff(g,x2)];

x0=[-5 -4]
%initial guess

step=0;
reversed=inv(J(x0(1),x0(2)));
while dx>tol
    %reversed=inv(J(x0(1),x0(2)));
    last=[h(x0(1),x0(2));g(x0(1),x0(2))];
    x1=x0-reversed*last;
    dx=norm(x1-x0);
    x0=x1
    step=step+1;
end
disp(step)
disp(x0)
