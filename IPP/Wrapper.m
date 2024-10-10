% Here, the polynomial 10 - 2x - x^2 + x^3 is defined.
%
% Note: This is just an example! You can (and should) try
% with many different polynomials to make sure that your
% program can handle all cases.

clear
clc

polynomialCoefficients = [1 -1 1 -1 1];
startingPoint = 1;
tolerance = 0.0001;

if length(polynomialCoefficients) < 3
     error('the degree of the polynomial must be 2 or larger')
end

iterationValues = RunNewtonRaphson(polynomialCoefficients, startingPoint, tolerance);
PlotIterations(polynomialCoefficients,iterationValues);
