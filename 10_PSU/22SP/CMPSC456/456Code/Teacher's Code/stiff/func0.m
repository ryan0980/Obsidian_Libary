function f=func0(y)

K1=0.1; K2=0.1; K3=100;

f= zeros(3,1);

f(1)= -K1*y(1)*y(2) + K2*y(3);
f(2)= -K1*y(1)*y(2) + K2*y(3) - K3*y(2)*y(3);
f(3)=  K1*y(1)*y(2) - K2*y(3) - K3*y(2)*y(3);

end