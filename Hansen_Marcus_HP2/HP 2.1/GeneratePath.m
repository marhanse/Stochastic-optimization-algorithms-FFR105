function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)
    tabuList = [];
    numNodes = size(pheromoneLevel, 1);
    
    startNode = randi([1, numNodes]);
    tabuList(end + 1) = startNode;

    while length(tabuList) < numNodes 
        p = CalculateProbability(pheromoneLevel, visibility, alpha, beta, startNode, tabuList);
        next = GetNode(p);

        startNode = next;

        tabuList(end + 1) = startNode;
    end

    path = tabuList;
end
