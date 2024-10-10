function velocity = InitializeVelocity(xMax,xMin, N,n, alpha,deltaT)
    velocity = zeros(N,n);
    for i = 1:N
        r = rand;
        for j = 1:n
            particleVelocity = (alpha/deltaT) *((-(xMax - xMin)/2) + r*(xMax-xMin));
            velocity(i,j) = particleVelocity;
            r = rand;
        end
    end
        


end

