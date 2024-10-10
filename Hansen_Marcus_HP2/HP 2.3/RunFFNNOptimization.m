function[maximumFitness, bestChromosome,validationFitnessPerGeneration,maximumTrainingFitnessPerGeneration,chromosomesPerGeneration] = RunFFNNOptimization(populationSize, numberOfGenes, wMax, inputNeurons, hiddenNeurons,outputNeurons, crossoverProbability, mutationProbability, creepRate,creepProbability,tournamentProbability,tournamentSize)


 format long
 population = InitializePopulation(populationSize,numberOfGenes);

 maximumFitness  = 0;
 validationFitnessPerGeneration = [];
 maximumTrainingFitnessPerGeneration = [];
 noValidationchange = 0;
 currentLossValidationFitness = 0;
 numberOfGenerations = 0;
 chromosomesPerGeneration={};


 while true 
   numberOfGenerations = numberOfGenerations +1;
   fprintf('Generation: %d\n',numberOfGenerations)
   maximumFitness  = 0.0;
   fitnessList = zeros(1,populationSize);
   for i = 1:populationSize
     chromosome = population(i,:);
     [wIH,WHO] = DecodeChromosome(chromosome,inputNeurons, hiddenNeurons,outputNeurons,wMax);
     fitnessList(i) = EvaluateIndividual(wIH,WHO,1);
     if (fitnessList(i) > maximumFitness ) 
        maximumFitness  = fitnessList(i);
        iBestIndividual = i;
        bestChromosome = EncodeNetwork(wIH,WHO,wMax) ;
    end
   end
 
   temporaryPopulation = population;  
   for i = 1:2:populationSize
    i1 = TournamentSelect(fitnessList, tournamentProbability, tournamentSize);
    i2 = TournamentSelect(fitnessList, tournamentProbability, tournamentSize);
    r = rand;
    if (r < crossoverProbability) 
     individual1 = population(i1,:);
     individual2 = population(i2,:);
     newIndividualPair = Cross(individual1, individual2);
     temporaryPopulation(i,:) = newIndividualPair(1,:);
     temporaryPopulation(i+1,:) = newIndividualPair(2,:);
    else
     temporaryPopulation(i,:) = population(i1,:);
     temporaryPopulation(i+1,:) = population(i2,:);     
    end
   end
  
   temporaryPopulation(1,:) = population(iBestIndividual,:);
   for i = 2:populationSize
     tempIndividual = CreepMutate(temporaryPopulation(i,:),mutationProbability,creepRate,creepProbability);
     temporaryPopulation(i,:) = tempIndividual;
   end
   population = temporaryPopulation;
    
   maximumTrainingFitnessPerGeneration = [maximumTrainingFitnessPerGeneration, maximumFitness];
   chromosomesPerGeneration{numberOfGenerations} = bestChromosome;
   
   % Validate the best found chromosome yet 
   [wIH,WHO] = DecodeChromosome(bestChromosome,inputNeurons, hiddenNeurons,outputNeurons,wMax);
   newGenerationValidationFitness = EvaluateIndividual(wIH,WHO,2);
   validationFitnessPerGeneration = [validationFitnessPerGeneration, newGenerationValidationFitness]; 

   if newGenerationValidationFitness == currentLossValidationFitness
        currentLossValidationFitness = newGenerationValidationFitness;
        noValidationchange = noValidationchange + 1;
        if noValidationchange > 2000
            break
        end
   else
       currentLossValidationFitness = newGenerationValidationFitness;
       noValidationchange = 0;
   end
 end                                                                                                       
end

