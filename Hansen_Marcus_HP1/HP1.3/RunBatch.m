%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameter specifications
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

numberOfRuns = 100;                % Do NOT change
populationSize = 100;              % Do NOT change
maximumVariableValue = 5;          % Do NOT change (x_i in [-a,a], where a = maximumVariableValue)
numberOfGenes = 50;                % Do NOT change
numberOfVariables = 2;		   % Do NOT change
numberOfGenerations = 300;         % Do NOT change
tournamentSize = 2;                % Do NOT change
tournamentProbability = 0.75;      % Do NOT change
crossoverProbability = 0.8;        % Do NOT change


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Batch runs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define more runs here (pMut < 0.02) ...
pMut = [0.00, 0.02, 0.03, 0.04, 0.06, 0.08, 0.10, 0.20, 0.30, 0.40];

maximumFitnessList = zeros(numberOfRuns,length(pMut));
for i = 1:length(pMut)
    mutationProbability = pMut(i);
    sprintf('Mutation rate = %0.5f', mutationProbability)
    for j = 1:numberOfRuns 
     [maximumFitness, bestVariableValues]  = RunFunctionOptimization(populationSize, numberOfGenes, numberOfVariables, maximumVariableValue, tournamentSize, ...
                                           tournamentProbability, crossoverProbability, mutationProbability, numberOfGenerations);
      sprintf('Run: %d, Score: %0.10f', j, maximumFitness)
      maximumFitnessList(j,i) = maximumFitness;
    end
end


% ... and here (pMut > 0.02)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Summary of results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Add more results summaries here (pMut < 0.02) ...

medianValues = zeros(1,length(maximumFitnessList(1,:)));
averages = zeros(1,length(maximumFitnessList(1,:)));
stds = zeros(1,length(maximumFitnessList(1,:)));

for i = 1:length(medianValues)
    average = mean(maximumFitnessList(:,i));
    averages(i) = average;
    medianValue = median(maximumFitnessList(:,i));
    medianValues(i) = medianValue;
    std = sqrt(var(maximumFitnessList(:,i)));
    stds(i) = std;
    sprintf('PMut = %0.10f: Median: %0.10f, Average: %0.10f, STD: %0.10f',pMut(i), medianValue, average, std)
% ... and here (pMut > 0.02)
end

%%


plot(pMut, medianValues, 'bo-', 'LineWidth', 0.7, 'MarkerSize', 3);

title('Median fitness value for different value of mutation probability ')
xlabel('Mutation probability');
ylabel('Median fitness value');
grid on;
grid minor;
xlim([0, 0.4]);
ylim([0.965, 1.005]);
yline(1, '--k', 'LineWidth', 1);

legend('Median', 'Location', 'best', 'FontSize', 12);


