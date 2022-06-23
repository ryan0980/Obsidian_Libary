y0=[1 1 0];

[t1 y1]= ImEuler([0 120],y0,0.05,@func0,@grad0);

[t2 y2]= ImTrap([0 120],y0,0.05,@func0,@grad0);

[t3 y3]= RK2([0 120],y0,0.05,@func0,@grad0);

[t4 y4]= RK4([0 120],y0,0.05,@func0,@grad0);