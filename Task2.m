clc
clear all
close all

data = xlsread('variant.xlsx');
X = data(:,1);
y = data(:,2);

X_min = min(X);
X_max = max(X);
t = 2 * pi * (X - X_min) / (X_max - X_min);

XX1 = [X.^0,X,X.^2,X.^4,cos(t),cos(2*t),sin(t),sin(2*t),cos(3*t)];
XX2 = [X,cos(t),cos(2*t),sin(t),sin(2*t)];

[b1,Y1,e1,S1,sigma_squared1,n1,s1] = linear_regression_mnk(XX1, y);
[b2,Y2,e2,S2,sigma_squared2,n2,s2] = linear_regression_mnk(XX2, y);


plot(X, y, '.b');
hold on
plot(X, Y1, 'r');
hold on
plot(X, Y2, 'g');


% проверка гипотезы о значимости факторов по критерию —тьюдента
[answer] = Student(n1,s1,XX1,sigma_squared1,b1)

% проверка гипотезы о значимости группы факторов по критерию ‘ишера
[answer1] = Fisher(n1, s1, n2, s2, XX1, XX2, S1, S2)

% проверка гипотезы о значимости факторов короткой модели по критерию —тьюдента
[answer2] = Student(n2,s2,XX2,sigma_squared2,b2)

sigma_squared1
sigma_squared2
R1 = calc_r2(S1,y)
R2 = calc_r2(S2,y)
R2-R1
% доверительные интервалы дл€ коэффициентов модели
for i = 1:length(b2)
    confidence_interval_for_model_coeff(i,:) = confidence_interval(XX2, sigma_squared2, b2(i), n2, s2, i);
end
b2
confidence_interval_for_model_coeff
%hold on
%plot(X, confidence_interval_for_model_coeff, 'b');

% доверительный интервал дл€ прогноза и отклика
q = tinv(0.95, n2-s2);
V = inv(XX2' * XX2);
for i = 1:s2
    confidence_interval_for_prognosis = [Y2 - q * sqrt(sigma_squared2 * (XX2(i,:) * V * XX2(i,:)')), Y2 + q * sqrt(sigma_squared2 * (XX2(i,:) * V * XX2(i,:)'))];
    confidence_interval_for_response_variable = [Y2 - q * sqrt(sigma_squared2 * (XX2(i,:) * V * XX2(i,:)' + 1)), Y2 + q * sqrt(sigma_squared2 * (XX2(i,:) * V * XX2(i,:)' + 1))];
end

hold on
plot(X,confidence_interval_for_prognosis,'k',X,confidence_interval_for_response_variable,'y');
