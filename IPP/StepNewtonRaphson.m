% This method should perform a single step of the Newton-Raphson method.
% Note: In cases where the step cannot be completed, e.g. if f" = 0, a
% clear error message should be given.

function xNext = StepNewtonRaphson(x, fPrime, fDoublePrime)
    if fDoublePrime == 0 
        xNext = NaN;
        disp('The second derivative equals zeros at the given x value and can therefore not be computed') 
    else
        xNext = x - fPrime/fDoublePrime;
    end
end