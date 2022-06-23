function y = M_20220214456HW4_3_1(func,a,b,N)
%gaussq

h = (b-a)/N;
y = 0;
for i = 1:N
    y = y+gauss3(func,a+(i-1)*h,a+i*h);
end