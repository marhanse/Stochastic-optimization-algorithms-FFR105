% This function should run the Newton-Raphson method, making use of the
% other relevant functions (StepNewtonRaphson, DifferentiatePolynomial, and
% GetPolynomialValue). Before returning iterationValues any non-plottable values 
% (e.g. NaN) that can occur if the method fails (e.g. if the input is a
% first-order polynomial) should be removed, so that only values that
% CAN be plotted are returned. Thus, in some cases (again, the case of
% a first-order polynomial is an example) there may be no points to plot.

function iterationValues = RunNewtonRaphson(polynomialCoefficients, startingPoint, tolerance)

    iterationValues = [];
    xNow = startingPoint;
    iterationValues(end+1) = xNow;
    while true
       xLast = xNow;

       firstOrderDifferentiateCoefficients = DifferentiatePolynomial(polynomialCoefficients, 1);
       fPrimeValue = GetPolynomialValue(xLast, firstOrderDifferentiateCoefficients);
       
       secondOrderDifferentiateCoefficients = DifferentiatePolynomial(polynomialCoefficients, 2);
       fDoublePrimeValue = GetPolynomialValue(xLast, secondOrderDifferentiateCoefficients);
       
       xNow = StepNewtonRaphson(xLast,fPrimeValue,fDoublePrimeValue);

       if isnan(xNow)
           break
       end
       
       if abs(xNow - xLast) < tolerance
           break 
       else
           iterationValues(end+1) = xNow;
       end
        
    end