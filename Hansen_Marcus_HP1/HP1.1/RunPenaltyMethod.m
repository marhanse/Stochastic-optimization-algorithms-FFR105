%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Penalty method for minimizing

%(x1-1)^2 + 2(x2-2)^2, s.t.

%x1^2 + x2^2 - 1 <= 0.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%The values below are suggestions - you may experiment with
%other values of eta and other (increasing) sequences of the
%µ parameter (muValues).

clc
clear

muValues = [1 10 100 1000];
eta = 0.0001;
xStart = [1 2];
gradientTolerance = 1E-6;

x1_values = zeros(length(muValues), 1);
x2_values = zeros(length(muValues), 1);

for i = 1:length(muValues)
    mu = muValues(i);
    x = RunGradientDescent(xStart, mu, eta, gradientTolerance);
    x1_values(i) = x(1);
    x2_values(i) = x(2);
    fprintf('x(1) = %3f, x(2) = %3f, mu = %d\n', x(1), x(2), mu)
end

%Plot x1 and x2 as functions of µ
figure;
plot(muValues, x1_values, '-o', 'DisplayName', 'x_{1}');
hold on;
plot(muValues, x2_values, '-o', 'DisplayName', 'x_{2}');
xlabel('µ');
ylabel('Value');
title('x_{1} and x_{2} as Functions of µ');
legend;
grid on;


