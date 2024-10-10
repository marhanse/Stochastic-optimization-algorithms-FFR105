function position = InitializePositions(xMax,xMin,N,n)

    position = zeros(N,n);
    for i = 1:N
        r = rand;
        for j = 1:n
            particlePostion = xMin + r*(xMax-xMin);
            position(i,j) = particlePostion;
            r = rand;
        end
    end
end

