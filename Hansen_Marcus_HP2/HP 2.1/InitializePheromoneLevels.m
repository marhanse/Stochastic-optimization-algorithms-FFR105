function pheromoneLevel = InitializePheromoneLevels(numberOfCities, tau0)
    
    pheromoneLevel = zeros(numberOfCities,numberOfCities);
    pheromoneLevel = pheromoneLevel + tau0;

end

