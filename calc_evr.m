function [ evr ] = calc_evr( S2, n, m )
% Оценка дисперсии остатков (estimation of variance of residuals)

evr = S2 / (n - m);

end

