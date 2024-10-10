function yEstimate= ComputeYEstimate(x,chromosome,variableregisters,constants)

    result = zeros(1,variableregisters);
    
    result = [result constants];

    result(1) = x;

    for i = 1:length(chromosome)
        if mod(i, 4) == 1
            operator = chromosome(i);
        elseif mod(i, 4) == 2
            destination = chromosome(i);
        elseif mod(i, 4) == 3
            operand1 = chromosome(i);
        else
            operand2 = chromosome(i);
            if operator == 1
            result(destination) = Summation(result(operand1),result(operand2));
            elseif operator == 2
            result(destination) = Diffrence(result(operand1),result(operand2));
            elseif operator == 3
            result(destination) = Multiplication(result(operand1),result(operand2));
            else
            result(destination) = Division(result(operand1),result(operand2));
            end
        end
    end
   
    yEstimate = result(1);
    
end

