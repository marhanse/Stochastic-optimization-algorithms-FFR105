%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Initial Parameters 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear
format long
populationSize = 100;                                    	  
tournamentSize = 5;                
tournamentProbability = 0.75;      
crossoverProbability = 0.20;                
numberOfGenerations = 10000; 
numberOfRuns = 10;
a = 5;
decayConstant = 0.5;

operators = 4;
variableRegisters = 3;
constantRegisters = 3;
totalRegisters = variableRegisters + constantRegisters;
c1 = 1;
c2 = 2;
c3 = -1;
constants = [c1,c2,c3];

minChromosomeLength = 4;
maxChromosomeLength = 160;

functionData = LoadFunctionData;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Run LGP program 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tic
absoluteBestFitness = 0;
for runs = 1:numberOfRuns
    maximumFitness  = 0;
    population = InitializePopulation(populationSize,minChromosomeLength,maxChromosomeLength,variableRegisters, ...
        operators,totalRegisters);
    currentBestFitness = 0;
    sameFitnessCounter = 0;
    for generation = 1:numberOfGenerations
        fprintf('Generation: %d, Run: %d\n', generation, runs);
        if mod(generation,100) == 0
            if a > 1
                a = a - decayConstant;
            else
                a = 1;
            end
        end
        maximumFitness  = 0.0;
        fitnessList = zeros(1,populationSize);
        for i = 1:populationSize
         chromosome = population(i).Chromosome;
         fitnessList(i) = EvaluateIndividual(functionData,chromosome,variableRegisters,constants);
             if (fitnessList(i) > maximumFitness) 
                maximumFitness  = fitnessList(i);
                iBestIndividual = i;
                bestChromosomeValues = chromosome;
            end
        end
    
    temporaryPopulation = population;  
    for i = 1:2:populationSize
        i1 = TournamentSelect(fitnessList,tournamentProbability,tournamentSize);
        i2 = TournamentSelect(fitnessList,tournamentProbability,tournamentSize);
        r = rand;
        if (r < crossoverProbability) 
             individual1 = population(i1).Chromosome;
             individual2 = population(i2).Chromosome;
             [newIndividual1, newIndividual2] = Cross(individual1, individual2,maxChromosomeLength);
             temporaryPopulation(i).Chromosome = newIndividual1;
             temporaryPopulation(i+1).Chromosome = newIndividual2;
        else
             temporaryPopulation(i).Chromosome = population(i1).Chromosome;
             temporaryPopulation(i+1).Chromosome = population(i2).Chromosome;   
        end
    end
    
    temporaryPopulation(1).Chromosome = population(iBestIndividual).Chromosome;
    for i = 2:populationSize
         tempIndividual = Mutate(temporaryPopulation(i).Chromosome,variableRegisters,operators,totalRegisters,a);
         temporaryPopulation(i).Chromosome = tempIndividual;
    end
    population = temporaryPopulation;

    end
    
    if maximumFitness > absoluteBestFitness
        absoluteBestFitness = maximumFitness;
        absoluteBestChromosome = bestChromosomeValues;
    end
end
disp('-----------------------------------------------------------------')
fprintf('Absolute best fitness of all runs: %d\n', absoluteBestFitness);
disp('-----------------------------------------------------------------')
toc
