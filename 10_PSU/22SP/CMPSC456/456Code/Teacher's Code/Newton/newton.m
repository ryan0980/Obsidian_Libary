function x= newton(x0,f,tol)

dx=1.0;

while dx>tol
    [F,G,H]=feval(f,x0); 
    
    x1 = x0 - H\G;
    
    dx=norm(x1-x0);
    
    x0=x1;

    disp(x0');
end
x=x0;