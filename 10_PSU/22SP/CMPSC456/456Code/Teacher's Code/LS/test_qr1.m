x=2:0.1:4;


A=zeros(21,8);
for i=1:8
    A(:,i)=x'.^(i-1);
end


[Q,R]= gs(A);