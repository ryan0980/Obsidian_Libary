function g=grad0(y)

K1=0.1; K2=0.1; K3=100;

g= zeros(3,3);

g(1,:)=[-K1*y(2) -K1*y(1) K2];
g(2,:)=[-K1*y(2) -K1*y(1)-K3*y(3) K2];
g(3,:)=[K1*y(2) K1*y(1)-K3*y(3) -K2-K3*y(2)];

end