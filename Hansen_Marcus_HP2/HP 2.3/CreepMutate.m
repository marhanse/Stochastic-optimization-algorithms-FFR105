function mutatedIndividual = CreepMutate(individual, mutationProbability,creepProbability,creepRate)
    numberOfGenes = size(individual, 2);
    mutatedIndividual = individual;
    
    for j = 1:numberOfGenes
        r = rand;
      if (r < mutationProbability)
        r = rand;
        if (r < creepProbability)
            mutatedIndividual(j) = individual(j) - creepRate/2 + creepRate*r;
        else
            mutatedIndividual(j) = r;
        end
      else
      end
    end
end
