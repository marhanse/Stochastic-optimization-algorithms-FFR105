function fitness = EvaluateIndividual(functionData,chromosome,variableRegister,constants)
    numberOfdataPoints = size(functionData,1);
    summationSquaredErrors = 0;
    for i = 1:numberOfdataPoints
        xFunctionDataValue = functionData(i,1);
        yFunctionDataValue = functionData(i,2);
        yEstimatedValue = ComputeYEstimate(xFunctionDataValue,chromosome,variableRegister,constants);

        squaredDiff = (yEstimatedValue - yFunctionDataValue)^2;
        summationSquaredErrors = summationSquaredErrors + squaredDiff;
    end
    
    error = sqrt(summationSquaredErrors/numberOfdataPoints);
    fitness = 1/error;
    
end