function [t,y]=ImTrap(int,y0,h,func,grad)

t(1)=int(1); y(1,:)=y0; N=length(y0);
n=round((int(2)-int(1))/h);
for i=1:n
    t(i+1)=t(i)+h;
    
    % apply Newton's method
    z= y(i,:)'; r= 1.0; fv=1.0;
    while r> 1e-10|| fv>1e-6
        F = z - y(i,:)' - h/2*(func(z)+func(y(i,:)));
        G= eye(N,N) - h/2*grad(z);
        
        x = z - G\F;
        
        r = norm(x-z); fv=norm(F);
        
        z= x;
    end 
    
    y(i+1,:)=z';
end


