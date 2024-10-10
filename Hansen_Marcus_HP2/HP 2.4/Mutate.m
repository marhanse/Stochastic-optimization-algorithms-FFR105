function mutatedIndividual = Mutate(individual,variableRegisters,operators,totalRegisters,a)
    numberOfGenes = size(individual, 2);
    mutatedIndividual = individual;
    mutationProbability = a / numberOfGenes;
    
    for j = 1:numberOfGenes
        r = rand;
        if (r < mutationProbability)
            if mod(j, 4) == 1
                mutatedIndividual(j) = randi([1,operators]);
            elseif mod(j, 4) == 2
                mutatedIndividual(j) = randi([1,variableRegisters]);
            elseif mod(j, 4) == 3
                mutatedIndividual(j) = randi([1,totalRegisters]);
            else
                mutatedIndividual(j) = randi([1,totalRegisters]);
            end
        end
    end
end
