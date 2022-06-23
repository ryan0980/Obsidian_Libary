
f_ode=@(t,y) [y(1);-y(1)^2-y(1)];

plot(y(:,1),y(:,2))
numSteps=1000;
x(1) = 0;
h =  0.03;
y(:,1) = [-25,6];
yhalf = y(:,k) + 0.5 * h * fVa;
fVhalf = f_ode( xhalf, yhalf );
k = 1;
fVa = f_ode( x(k), y(:,k) );
xhalf = x(k) + 0.5 * h;


x(1,k+1) = x(1,k) + h;
y(:,k+1) = y(:,k) + h * fVhalf;

for k = 2 : numSteps
    
fV=fVa;
fVa = f_ode( x(k), y(:,k) );

x(1,k+1) = x(1,k) + h;
y(:,k+1) = y(:,k) + h * ( 3 * fVa - fV ) / 2;

end
