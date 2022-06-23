X=1950:5:1980;
Y=[53.05 73.04 98.31 139.78 193.48 260.20 320.39];
logY= log(Y);

A=[ones(size(X')) X'];
b=logY';

c=(A'*A)\(A'*b);

c(1)= exp(c(1));

plot(X,Y,'ko')
hold on
x= 1950:0.1:1980;
plot(x,c(1)*exp(c(2)*x))
