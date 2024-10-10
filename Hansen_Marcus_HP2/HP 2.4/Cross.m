function [newIndividual1, newIndividual2] = Cross(individual1, individual2,maxChromosomeLength)

    lengthIndividualOne = length(individual1);
    lengthIndividualTwo = length(individual2);

    valueRange1 = 1:4:lengthIndividualOne;
    valueRange2 = 1:4:lengthIndividualTwo;

   
    r = randi([1,length(valueRange1)]);
    crossPoint1IndividualOne = valueRange1(r);
    r = randi([1,length(valueRange1)]);
    crossPoint2IndividualOne = valueRange1(r);

    r = randi([1,length(valueRange2)]);
    crossPoint1IndividualTwo = valueRange2(r);
    r = randi([1,length(valueRange2)]);
    crossPoint2IndividualTwo = valueRange2(r);
    
    if crossPoint1IndividualOne > crossPoint2IndividualOne
        sectionToStartOne = individual1(1:crossPoint2IndividualOne-1);
        sectionBetweenCrossPointsOne = individual1(crossPoint2IndividualOne:crossPoint1IndividualOne-1);
        sectionToEndOne = individual1(crossPoint1IndividualOne:end);
    else
        sectionToStartOne = individual1(1:crossPoint1IndividualOne-1);
        sectionBetweenCrossPointsOne = individual1(crossPoint1IndividualOne:crossPoint2IndividualOne-1);
        sectionToEndOne = individual1(crossPoint2IndividualOne:end);
    end

    if crossPoint1IndividualTwo > crossPoint2IndividualTwo
        sectionToStartTwo = individual2(1:crossPoint2IndividualTwo-1);
        sectionBetweenCrossPointsTwo = individual2(crossPoint2IndividualTwo:crossPoint1IndividualTwo-1);
        sectionToEndTwo = individual2(crossPoint1IndividualTwo:end);
    else
        sectionToStartTwo = individual2(1:crossPoint2IndividualTwo-1);
        sectionBetweenCrossPointsTwo = individual2(crossPoint1IndividualTwo:crossPoint2IndividualTwo-1);
        sectionToEndTwo = individual2(crossPoint1IndividualTwo:end);
    end

 
    newIndividual1 = [sectionToStartOne sectionBetweenCrossPointsTwo sectionToEndOne];
    newIndividual2 = [sectionToStartTwo sectionBetweenCrossPointsOne sectionToEndTwo];

    if length(newIndividual1) > maxChromosomeLength
        newIndividual1 = newIndividual1(1:maxChromosomeLength);
    end

    if length(newIndividual2) > maxChromosomeLength
        newIndividual2 = newIndividual2(1:maxChromosomeLength);
    end 

end