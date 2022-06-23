function [t,y]=ImEuler(int,y0,h,func,grad)

t(1)=int(1); y(1,:)=y0; N=length(y0);
n=round((int(2)-int(1))/h);
for i=1:n
    t(i+1)=t(i)+h;
    
    % apply Newton's method
    z= y(i,:)'; r= 1.0;
    while r> 1e-10
        F = z - y(i,:)' - h*func(z);
        G = eye(N,N) - h*grad(z);
        
        x = z - G\F;
        
        r = norm(x-z);
        
        z= x;
    end 
    
    y(i+1,:)=z';
end


