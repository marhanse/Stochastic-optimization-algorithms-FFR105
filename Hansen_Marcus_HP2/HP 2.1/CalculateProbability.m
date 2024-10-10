function p = CalculateProbability(pheromoneLevel, visibility, alpha, beta, startNode, tabuList)
    tau_alpha = pheromoneLevel.^alpha;
    eta_beta = visibility.^beta;

    numerator = tau_alpha(startNode, :) .* eta_beta(startNode, :);
    
    numerator(tabuList) = 0;
    
    denominatorSum = sum(numerator);

    p = zeros(1, length(numerator));

    for j = 1:length(numerator)
        if denominatorSum ~= 0
            p(j) = numerator(j) / denominatorSum;
        else
            p(j) = 0;
        end
    end
end
