function selectedIndividualIndex = TournamentSelect(fitnessList, tournamentProbability, tournamentSize)
    populationSize = size(fitnessList,2);
    tournamentIndividualsIndex = randi([1, populationSize], 1,tournamentSize);
    tournamentIndividualsValues = fitnessList(tournamentIndividualsIndex);
    [~, tournamentIndividualsIndexSorted] = sort(tournamentIndividualsValues, 'descend');
    sortedTournamentIndividualsIndex = tournamentIndividualsIndex(tournamentIndividualsIndexSorted);
    
    for iIteration = 1:length(sortedTournamentIndividualsIndex)
        r = rand;
        if r < tournamentProbability 
            selectedIndividualIndex = sortedTournamentIndividualsIndex(iIteration);
            break
        elseif iIteration == length(sortedTournamentIndividualsIndex)
            selectedIndividualIndex = sortedTournamentIndividualsIndex(iIteration);
            break
        else
            
        end
    end
end
