function G=grad1(y)

% compute the gradient of the force for the flexible pendulum model
% y= (x1, v2, x2, v2)

L=1; eps=1e-5; g=1;

N= length(y);
G= zeros(N,N);

x1=y(1); x2=y(3); r2= x1^2+x2^2; r=sqrt(r2);

G(1,2)= 1; 
G(3,4)= 1; 
G(2,1)= -(x1^2/r2+(r-L)*(1/r - x1^2/r/r2))/eps/eps;
G(2,3)= -(x1*x2/r2-(r-L)*x1*x2/r/r2)/eps/eps;

G(4,1)= G(2,3);
G(4,3)= -(x2^2/r2+(r-L)*(1/r-x2^2/r/r2))/eps/eps;

