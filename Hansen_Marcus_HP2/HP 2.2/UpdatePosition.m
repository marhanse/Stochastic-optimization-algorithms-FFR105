function newParticlePositions = UpdatePosition(particlePositions,particleVelocities)

    newParticlePositions = zeros(size(particlePositions));
    for i = 1:size(particlePositions,1)
        for j = 1:size(particlePositions,2)
            newParticlePositions(i,j) = particlePositions(i,j) + particleVelocities(i,j);
        end
    end
end