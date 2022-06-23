function [Q,R] = gs(X)
    % Classical Gram-Schmidt.  [Q,R] = gs(X);

    [n,m] = size(X);
    Q = zeros(n,m);
    R = zeros(m,m);
    for j = 1:m
        
        y= X(:,j);
        for i=1:j-1
            R(i,j)= dot(Q(:,i),X(:,j)); % dot product betw ij and aj
            y= y - R(i,j)*Q(:,i);
        end
        R(j,j)= norm(y);
        Q(:,j)= y/R(j,j);

%         Q(:,j) = X(:,j);
%         if j ~= 1
%             R(1:j-1,j) = Q(:,1:j-1)'*Q(:,j);
%             Q(:,j) = Q(:,j) - Q(:,1:j-1)*R(1:j-1,j);
%         end
%         R(j,j) = norm(Q(:,j));
%         Q(:,j) = Q(:,j)/R(j,j);


     end
end