function x= M_20220119cmpsc456hw1mod(x0,tol)
x0=[-5 -4];

dx=1.0;
c=0;

syms f(x1,x2)
f(x1,x2)= x1.^2-x2.^2+2.*x2;
syms g(x1,x2)
g(x1,x2)=2.*x1+x2.^2-6;
syms ja(x1,x2)
ja(x1,x2)=[diff(f,x1) diff(f,x2);diff(g,x1) diff(g,x2)];

while dx>tol
    
    jacob=inv(ja(x0(1),x0(2)))
    x1 = x0 - vpa(jacob*[f(x0(1),x0(2));g(x0(1),x0(2))]);
    
    dx=norm(x1-x0);
    
    x0=x1;
    c=c+1;
    disp(x0');
end
disp(c);
x=x0;