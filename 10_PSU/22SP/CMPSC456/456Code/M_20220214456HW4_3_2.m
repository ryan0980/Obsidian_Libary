%testg.m
%M_20220214456HW4_3_2.m
a = 0;
b = 1;
y0 = 100;
for N = logspace(0,6,7)
    y1 = M_20220214456HW4_3_1(@f,a,b,N);
    err = abs((y1-y0)/y0);
    if err < 1.0e-10
        break;
    end
    y0 = y1;
end
fprintf('Integral = %17.15f, intervals = %d, error = %e\n',y1,N,err);