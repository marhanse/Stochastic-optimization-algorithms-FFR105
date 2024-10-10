function visibility = GetVisibility(cityLocation)
    
    visibility = zeros(size(cityLocation,1));
    for i = 1:size(visibility,1)
        for j = 1:size(visibility,1)
        x1 = cityLocation(i,1);
        x2 = cityLocation(j,1);
        y1 = cityLocation(i,2);
        y2 = cityLocation(j,2);
        deltaX = x2-x1;
        deltaY = y2-y1;
        distance = sqrt((deltaX^2 + deltaY^2));
            if distance == 0 
                visibility(i,j) = 1e-15;
            else
                visibility(i,j) = 1/distance;
            end
        end
    end
end

