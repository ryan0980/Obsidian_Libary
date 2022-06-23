% Least-squares fit of a quadratic model 
% (second-order polynomial) to a set of 
% (simulated) measurement data.
%
% Samuli Siltanen April 2018

%% Parameters for plotting
lwidth = 2;
fsize = 20;
msize = 30;

%% Simulate some data. 
% First time instants, 
% then measurement values

tvec=[1.0; 1.1; 1.3; 1.5; 1.9; 2.1];
mvec=[1.84; 1.96; 2.21; 2.45; 2.94; 3.18];



% Plot the measurement
figure(1)
clf
plot(tvec,mvec,'r+','markersize',msize)
hold on
plot(tvec,mvec,'r.','markersize',msize)
axis equal

%% Let's construct the least-squares linear fit to the data
% We use the model m = at^2 + bt + c, where the real
% numbers a and b and c are our unknowns.
% Matrix equation: A*[a b c].' = v

% Construct system matrix A
A = [...
    t1^2 t1 1;...
    t2^2 t2 1;...
    t3^2 t3 1;...
    t4^2 t4 1;...
    t5^2 t5 1;...
    t6^2 t6 1;...
    ];

% Construct right-hand side vector v
v = mvec;

% Solve in the least squares sense
result = A\v;
a = result(1);
b = result(2);
c = result(3);

% Plot the quadratic model
tplot = linspace(t1,t7,128);
mplot = a*tplot.^2+b*tplot+c;
plot(tplot,mplot,'b','linewidth',lwidth)