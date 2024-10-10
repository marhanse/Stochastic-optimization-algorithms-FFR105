% First compute the function value, then compute the fitness
% value; see also the problem formulation.

function fitness = EvaluateIndividual(x)
    gComponent1 = (1.5 - x(1) + x(1) * x(2))^2;
    gComponent2 = (2.25 - x(1) + x(1) * x(2)^2)^2;
    gComponent3 = (2.625 - x(1) + x(1) * x(2)^3)^2;
    
    gValue = gComponent1 + gComponent2 + gComponent3;

    fitness = (gValue + 1)^(-1);
end
