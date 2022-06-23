
%
% Applying RK2 to a chemical reaction problem
%


close all

int=[0,80];

dt=1/2^4;

y0=[ 1 1 0];

[t2,y2]=RK2(int,y0,dt,@func0);

plot(t2,y2)