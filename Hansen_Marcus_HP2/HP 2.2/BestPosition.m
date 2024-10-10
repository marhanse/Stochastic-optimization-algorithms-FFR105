function [particleBestPositions, particleBestValue]= BestPosition(particlePositions,currentBestPositions, currentBestValues)
    particleBestPositions = zeros(size(particlePositions));
    particleBestValue = zeros(size(currentBestValues));
    
    for i = 1:size(particlePositions,1)
        x1 = particlePositions(i,1);
        x2 = particlePositions(i,2);
        particleValue = EvaluateParticle(x1,x2);
        if particleValue < currentBestValues(i)
           particleBestPositions(i,:) =  [x1,x2];
           particleBestValue(i) = particleValue;
        else
           particleBestPositions(i,:) = currentBestPositions(i,:);
           particleBestValue(i) = currentBestValues(i);
        end
    end
end

