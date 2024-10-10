function [bestSwarmPosition, bestSwarmValue] = BestSwarm(particlePositions, currentBestSwarmPosition, currentBestSwarmValue)
    bestSwarmPosition = currentBestSwarmPosition;
    bestSwarmValue = currentBestSwarmValue; 
    
    for i = 1:size(particlePositions,1)
        x1 = particlePositions(i,1);
        x2 = particlePositions(i,2);
        functionValue = EvaluateParticle(x1, x2);
        
        if functionValue < bestSwarmValue
            bestSwarmPosition = particlePositions(i,:);
            bestSwarmValue = functionValue;
        end
    end
end
