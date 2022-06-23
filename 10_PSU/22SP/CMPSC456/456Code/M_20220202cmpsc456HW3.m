
x=[1.0; 1.1; 1.3; 1.5; 1.9; 2.1];
y=[1.84; 1.96; 2.21; 2.45; 2.94; 3.18];
tol=10^-6;

%plot(x,y,'o')

%L = lsqr(x,y,tol)
t2 = 0:0.1:3.5;

p0 = polyfit(x,y,1);
y1 = polyval(p0,x);
Epp1=y1-y;
Ep1=sum(Epp1.^2);
display(Ep1);



p1 = polyfit(x,y,2);


y2 = polyval(p1,x);
figure

Epp2=y2-y;
Ep2=sum(Epp2.^2);
display(Ep2);

%plot(x,y,'o',t2,y2)

p2 = polyfit(x,y,3);

y3 = polyval(p2,x);
figure

Epp3=y3-y;
Ep3=sum(Epp3.^2);
display(Ep3);

plot(x,y,'o',x,y2,x,y3);