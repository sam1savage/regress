function [ evr ] = calc_evr( S2, n, m )
% ������ ��������� �������� (estimation of variance of residuals)

evr = S2 / (n - m);

end

