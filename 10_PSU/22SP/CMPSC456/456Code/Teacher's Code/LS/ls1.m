x=2:0.1:4;
y=1+x+x.^2+x.^3+x.^4+x.^5+x.^6+x.^7;

A=zeros(21,8);
for i=1:8
    A(:,i)=x'.^(i-1);
end
b=y';

AA=A'*A;
Ab=A'*b;
c= AA\Ab


return

[Q,R]= qr(A,0);

c= R\(Q'*b)
