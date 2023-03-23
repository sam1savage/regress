function [ answer ] = Student( n, s, X, sigma_squared, b )
% answer = zeros(s,1);
% t = zeros(s,1);
V = (X'*X)^(-1);
q = tinv(0.975,n-s);

t = b./sqrt(sigma_squared*diag(V));
answer = abs(t)>q;

% for j = 1:s
%     t(j) = b(j) / sqrt(sigma_squared * V(j,j));
%     if(t(j) < q) && (t(j) > -q)
%         answer(j) = 1;
%     else
%         answer(j) = 0;
%     end
% end


end

