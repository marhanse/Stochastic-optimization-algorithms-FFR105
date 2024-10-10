%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Run the FFNNOptimization 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
tic
clear
populationSize = 100;
crossoverProbability = 0.20;  
numberOfGenerations = 200;
tournamentProbability = 0.75;
tournamentSize = 4;
inputNeurons = 3;
hiddenNeurons = 4;   
outputNeurons = 2;
numberOfGenes = (hiddenNeurons * (inputNeurons+1)) + (outputNeurons*(hiddenNeurons+1));
creepRate = 0.005;
creepProbability = 0.8;
mutationProbability = 0.02;
wMax = 5;

[maximumFitness, bestVariableValues,validationFitnessPerGeneration,maximumTrainingFitnessPerGeneration,chromosomesPerGeneration] = RunFFNNOptimization(populationSize, numberOfGenes, wMax, inputNeurons, hiddenNeurons,outputNeurons, crossoverProbability, mutationProbability, creepRate,creepProbability,tournamentProbability,tournamentSize);
toc

%% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Plotting of the training and validation fitness per generation

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

trainingFitness = maximumTrainingFitnessPerGeneration;
validationFitness = validationFitnessPerGeneration;

generations = 1:numel(trainingFitness);

figure;
plot(generations, trainingFitness, 'b-', 'LineWidth', 2);
hold on;
plot(generations, validationFitness, 'r-', 'LineWidth', 2);
xlabel('Generations');
ylabel('Fitness');
legend('Training fitness', 'Validation fitness', 'Location', 'Best');

grid on;
hold off;
