function [ R2 ] = calc_r2( S2, y )
% ����������� ������������ R2

S0 = (y - mean(y))' * (y - mean(y));
R2 = 1 - S2 / S0;

end

