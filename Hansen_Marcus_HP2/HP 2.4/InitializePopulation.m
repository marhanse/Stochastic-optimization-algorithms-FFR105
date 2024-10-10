function population = InitializePopulation(populationSize,minChromosomeLength,maxChromosomeLength,variableRegisters, ...
    operators,totalRegisters)

population = [];
for i = 1:populationSize
 chromosomeLength = minChromosomeLength + fix(rand*(maxChromosomeLength-minChromosomeLength+1));
 numberOfInstructions = fix(chromosomeLength/4);
 chromosomeLength = numberOfInstructions*4;
 chromosome= zeros(1,chromosomeLength);
 for j = 1:chromosomeLength
    if mod(i, 4) == 1
        chromosome(j) = randi([1, operators]);
    elseif mod(i, 4) == 2
        chromosome(j) = randi([1, variableRegisters]);
    elseif mod(i, 4) == 3
        chromosome(j) = randi([1, totalRegisters]);
    else
        chromosome(j) = randi([1, totalRegisters]);
    end
 end
 tmpIndividual = struct('Chromosome',chromosome);
 population = [population tmpIndividual];
 end
end