function pathLength = GetPathLength(path,cityLocation)

    numberOfNodes = length(path);
    
    nodeIndex = path(1);
    lastNodeIndex = path(end);
    xCurrentNode = cityLocation(nodeIndex, 1);
    yCurrentNode = cityLocation(nodeIndex, 2);
    xLastNode = cityLocation(lastNodeIndex, 1);
    yLastNode = cityLocation(lastNodeIndex, 2);

    deltaX = xLastNode - xCurrentNode;
    deltaY = yLastNode - yCurrentNode;
    distanceHome = sqrt((deltaX^2 + deltaY^2));
    
    pathLength = distanceHome;
    for i = 2:numberOfNodes

        nextNodeIndex = path(i);
        xNextNode = cityLocation(nextNodeIndex, 1);
        yNextNode = cityLocation(nextNodeIndex, 2);
        deltaX = xNextNode - xCurrentNode;
        deltaY = yNextNode - yCurrentNode;
        distance = sqrt((deltaX^2 + deltaY^2));
        pathLength = pathLength + distance;

        xCurrentNode = xNextNode;
        yCurrentNode = yNextNode;

    end

end