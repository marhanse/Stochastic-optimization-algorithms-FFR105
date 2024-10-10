function population = InitializePopulation(populationSize,numberOfGenes)
        population = zeros(populationSize,numberOfGenes); 
        for i = 1:populationSize
            for j = 1:numberOfGenes
                    gene = rand; 
                    population(i,j) = gene;
            end
        end     
end
