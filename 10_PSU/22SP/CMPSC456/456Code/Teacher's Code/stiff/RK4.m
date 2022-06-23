function [t,y]=RK4(tint,y0,h,func)

% the forth order Runge-Kutta
% tint: time interval
% y0: initial value [should be a row vector]
% h:  step size
% func: the function on the right hand side y=func(x)
%           x  and y are column vectors
%

t(1)=tint(1); y(1,:)=y0;
n=round((tint(2)-tint(1))/h);
for i=1:n
    t(i+1)=t(i)+h;
    k1=func(y(i,:)');
    k2=func(y(i,:)'+1/2*h*k1);
    k3=func(y(i,:)'+1/2*h*k2);
    k4=func(y(i,:)'+h*k3);
    y(i+1,:)=y(i,:)+h/6*(k1+2*k2+2*k3+k4)';
end
