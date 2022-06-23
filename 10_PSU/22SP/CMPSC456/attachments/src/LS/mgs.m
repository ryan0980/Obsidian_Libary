function [Q,R] = mgs(X)
    % modified Gram-Schmidt.  [Q,R] = gs(X);

    [n,m] = size(X);
    Q = zeros(n,m);
    R = zeros(m,m);
    for j = 1:m
        
        y= X(:,j);
        for i=1:j-1
            R(i,j)= dot(Q(:,i),y);
            y= y - R(i,j)*Q(:,i);
        end
        R(j,j)= norm(y);
        Q(:,j)= y/R(j,j);

     end
end