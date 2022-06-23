clear all

L=1; eps=1e-5; g=1;

th=-pi/4;
y0=[L*cos(th)+eps 0 L*sin(th) 0 0];

[t1 y1]= ImEuler([0 60],y0,0.002,@func1,@grad1);

M=length(t1); y=y1;
for m=1:M
    E1(m)= .5*(y(m,2)^2+y(m,4)^2)+g*y(m,3)...
        +( sqrt(y(m,1)^2+y(m,3)^2) - L)^2/2/eps/eps;
end

[t2 y2]= ImTrap([0 60],y0,0.002,@func1,@grad1);
M=length(t2); y=y2;
for m=1:M
    E2(m)= .5*(y(m,2)^2+y(m,4)^2)+g*y(m,3)...
        +( sqrt(y(m,1)^2+y(m,3)^2) - L)^2/2/eps/eps;
end

[t3 y3]= ImRK2([0 60],y0,0.002,@func1,@grad1);
M=length(t3); y=y3;
for m=1:M
    E3(m)= .5*(y(m,2)^2+y(m,4)^2)+g*y(m,3)...
        +( sqrt(y(m,1)^2+y(m,3)^2) - L)^2/2/eps/eps;
end