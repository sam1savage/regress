function [ b, Y, e, S, sigma_squared, n, s] = linear_regression_mnk( X, y )
% Расчет коэффициента b линейной регрессии

b = (X' * X) \ X' * y;
Y = X * b;
e = y - Y;
S = (e' * e);
[n,s] = size(X);
sigma_squared = S / (n - s);
end

