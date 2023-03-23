function [ answer ] = Fisher( n1, s1, n2, s2, X1, X2, S1, S2 )
s = s1 - s2;
F = ((S2 - S1) / (s)) / (S1 / (n1 - s1));
q = finv(0.95,s,n1-s1);

% ���� �������� �� �����������, �� ������� ������������ �������� ������
if(F < q)
    answer = 1; %�������� �� �����������
else
    answer = 0; %�������� �����������
end

end

