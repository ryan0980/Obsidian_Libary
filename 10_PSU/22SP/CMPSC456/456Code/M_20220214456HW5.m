
A=[4 1 1 1; 1 3 -1 1; 1 -1 2 0; 1 1 0 2];
x0=[1; 0; 0; 0];

tol=10^-5;
dx=1.0;
step=0;

while dx>tol
    Ax0=A*x0;
    x1=1/max(Ax0);
    x1=x1*Ax0;
    
    dx=norm(x1-x0);
    x0=x1;
    step=step+1;
end
    
disp(step)
disp(x0)

