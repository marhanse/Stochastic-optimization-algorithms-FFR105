function functionValues = EvaluateParticle(x1,x2)
    objectiveFunction = @(x1,x2) (x1.^2 + x2 - 11).^2 + (x1 + x2.^2 - 7).^2 ;
    functionValues(:) = objectiveFunction(x1,x2);
end

