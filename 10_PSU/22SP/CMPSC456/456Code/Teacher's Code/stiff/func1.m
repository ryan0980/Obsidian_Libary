function f=PenFlex(y)

% compute the force for the flexible pendulum model
% y= (x1, v2, x2, v2)

L=1; eps=1e-5; g=1;

N= length(y);
f= zeros(N,1);

f(1)=y(2);
f(3)=y(4);

x1=y(1); x2=y(3); r2= x1^2+x2^2; r=sqrt(r2);

f(2)=-(r-L)*x1/r/eps^2;
f(4)=-(r-L)*x2/r/eps^2-g;