function node = GetNode(probability)
    r = rand;
    totalProbability = sum(probability);
    cumulativeProbability = 0;
    node = 0;
    
    for i = 1:size(probability, 2)
        cumulativeProbability = cumulativeProbability + probability(i);
        result = cumulativeProbability/totalProbability;
        if r < result
            node = i;
            break;
        end
    end
end


