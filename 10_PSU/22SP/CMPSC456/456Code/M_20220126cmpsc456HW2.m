tol=10^-6;
dx=1.0;


syms a(x1,x2,x3)
a(x1,x2,x3)= 15*x1+x2.^2-4*x3;
syms b(x1,x2,x3)
b(x1,x2,x3)=x1.^2+10*x2-x3;
syms c(x2,x3)
c(x2,x3)=x2.^3-25*x3-10;


x0=[1; 1; 1];
x1=[2; 2; 3];
fx=[-1; -1; -2];
ak=[1 0 0; 0 1 0; 0 0 1];

while dx<tol

    x1=x0-ak*fx;
    
    s=x1-x0;
    f01=roundn(double(a(x0(1),x0(2),x0(3))),-10);
    f02=roundn(double(b(x0(1),x0(2),x0(3))),-10);
    f03=roundn(double(c(x0(2),x0(3))),-10);
    f11=roundn(double(a(x1(1),x1(2),x1(3))),-10);
    f12=roundn(double(b(x1(1),x1(2),x1(3))),-10);
    f13=roundn(double(c(x1(2),x1(3))),-10);
    
    f0=[f01; f02; f03];
    f1=[f11; f12; f13];
    y=f1-f0;
    s2=norm(s);
    v=s;
    w=(ak*y-s)/s2;
    vt=v.';
    
    fa=ak-(w*vt*ak)/(1+vt*w);
    
    dx=norm(f1);
    x0=x1;
    ak=fa;
    disp(x0');

end
