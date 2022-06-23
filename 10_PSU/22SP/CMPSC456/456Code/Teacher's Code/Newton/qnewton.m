function x= qnewton(x0,f,tol)
%
% solve f(x)=0, with x0 being the initial guess and tol 
% the tolerance
%



[~,f0,J]=feval(f,x0); % the jacobian matrix at step 0

B= inv(J); % inv(B) in the note

dx=1.0;

while dx>tol
    
    
    x1 = x0 - B*f0;

    [~,f1,~]=feval(f,x1); 
    
    s=x1-x0;
    y=f1-f0;
    Bu= (B*y-s)/dot(s,s); % w in the note
    v=s;

    B1= B - Bu*v'*B/(1+v'*Bu); % inverse of A_{k+1}
    
    dx= norm(f1);

    x0= x1;
    f0= f1;
    B = B1;
    
    disp(x0');
end
x=x0;