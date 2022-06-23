t=3;

clc;
close all;

f = @(t,x) exp(t-x);
fex = @(t) log(exp(t)+exp(1)-1);   
% exact solution

h=0.1;
y(1) =1;     %initial value
 
i = 0;
while i<= 3
    i = i+1;
    K1 = f(x,y(i));         %initializing solution
    K2 = f(x+h*0.5,y(i)+h*K1*0.5);
    K3 = f(x+h, y(i)-h*K1 +K1*h);
y(i+1) =y(i)+h*(1/6)*(K1 +4*K2+K3);
g(i) = fex(x);
xx(i) = x;
Error(i) = abs(g(i) - y(i));     %error obtain
end
%plot result
%plot(xx,y(1:1+1),'k',xx,g,'y')
legend('RK3','Exact solution')
xlabel('x')
ylabel('y')
title('RK3 vs exact solution')