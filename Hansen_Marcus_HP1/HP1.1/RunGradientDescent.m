% This function should run gradient descent until the L2 norm of the
% gradient falls below the specified threshold.

function x = RunGradientDescent(xStart, mu, eta, gradientTolerance)
    
    while true
        x = xStart;
        gradientValue = ComputeGradient(x, mu);
        L2norm = norm(gradientValue);
        if L2norm < gradientTolerance
            break;
        else
            xStart = x - eta*gradientValue;
        end
    end
end