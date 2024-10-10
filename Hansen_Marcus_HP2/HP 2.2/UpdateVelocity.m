function newParticleVelocity = UpdateVelocity(particleVelocity,particlePositions,currentBestPositions, currentBestSwarmPosition,c1,c2,deltaT,w,maxVelocity)
    newParticleVelocity = zeros(size(particleVelocity));
    for i = 1:size(particleVelocity,1)
        r = rand;
        q = rand;
        for j = 1:size(particleVelocity,2)
           updateVelocity = (w*particleVelocity(i,j) + c1*q*((currentBestPositions(i,j)-particlePositions(i,j))/deltaT) + c2*r*((currentBestSwarmPosition(1,j)-particlePositions(i,j))/deltaT));
           newParticleVelocity(i,j) = updateVelocity;
           if newParticleVelocity(i,j) > maxVelocity
               newParticleVelocity(i,j) = maxVelocity;
           elseif newParticleVelocity(i,j) < -maxVelocity
               newParticleVelocity(i,j) = -maxVelocity;
           end
        end
    end
end