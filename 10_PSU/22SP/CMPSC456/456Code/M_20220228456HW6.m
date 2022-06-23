A=[4 1 1 1; 1 3 -1 1; 1 -1 2 0; 1 1 0 2];
x0=[1 0 0 0];
tol=10^-5;
dx=1.0;
step=0;
y=ones(4,1); 
 
while dx>tol
    x1=y/norm(y,2);
    y=A\x1;
    z=x1'*y;
    dx=norm(y-z.*x1,2);
    step=step+1;
end
%x=y/z;
%disp(x)
x=1/z;
disp(step)
%disp(z)
disp(x)

