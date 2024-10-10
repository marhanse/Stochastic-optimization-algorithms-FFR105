% This function should return the gradient of f_p = f + penalty.
% You may hard-code the gradient required for this specific problem.

function gradF = ComputeGradient(x,mu)
    
    functionPrimeTermX1 = 2*(x(1)-1);
    functionPrimeTermX2 = 4*(x(2)-2);
    penaltyPrimeTermX1 = 4*x(1)*mu*(x(1)^2 + x(2)^2-1);
    penaltyPrimeTermX2 = 4*x(2)*mu*(x(1)^2 + x(2)^2-1);

    derivativeRespectToX1 = functionPrimeTermX1 + penaltyPrimeTermX1;
    derivativeRespectToX2 = functionPrimeTermX2 + penaltyPrimeTermX2;
    
    gradF = [derivativeRespectToX1, derivativeRespectToX2];
    

    