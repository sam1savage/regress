function [ confidence_interval ] = confidence_interval( X, sigma_squared, b, n, s, i)

V = inv(X' * X);
q = tinv(0.95, n-s);

confidence_interval = [b - q * sqrt(sigma_squared * V(i,i)),b + q * sqrt(sigma_squared * V(i,i))];

end

