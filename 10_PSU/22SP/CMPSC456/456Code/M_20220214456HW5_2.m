
A=[4 1 1 1; 1 3 -1 1; 1 -1 2 0; 1 1 0 2];
x0=[1; 0; 0; 0]

tol=10^-5;
dx=1.0;
step=0;

%x1=A*x0
%dx=norm(x1)
%x0=x0*x1
while dx>tol
    y=A*x0;
    mu=(x0(1)*y(1)+x0(2)*y(2)+x0(3)*y(3)+x0(4)*y(4));
    x1=norm(y);
    dx=norm(x0-y/x1,2);
    x1=y/x1;
    
    
    x0=x1;
    step=step+1;
end

disp(step)
disp(x0)

