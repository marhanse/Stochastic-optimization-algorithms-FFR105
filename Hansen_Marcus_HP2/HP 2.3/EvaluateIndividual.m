function fitness = EvaluateIndividual(wIH, wHO,set)

    % Initial values for the truck 
    maxSlopeAngle = 10; 
    maxSpeed = 25;
    minSpeed = 1;
    startSpeed = 20;
    gear = 7;
    maxTemperature = 750;
    deltaT = 0.15;
    slopeLength = 1000;
    startPosition = 0;
    startBrakingTemperature = 500;
    
    if set == 1
        numberOfSlopes = 10;
    elseif set == 2 
        numberOfSlopes = 5;
    else
        numberOfSlopes = 5;
    end
    

    fitnessListPerSlope = zeros(numberOfSlopes,1);
    for i = 1:numberOfSlopes
        
        distanceTraveled = 0;
        currentPosition = startPosition;
        currentBrakeTemperature = startBrakingTemperature;
        currentSpeed = startSpeed;
        timeBetweenGearChange = 2;
        numberOfUpdates = 0;
        totalSpeed = currentSpeed;
        
        while true
            numberOfUpdates = numberOfUpdates + 1;
            currentSlopeAngel = GetSlopeAngle(currentPosition,i,set);
            horizontalDistance = currentSpeed * deltaT;
            distanceTraveled = distanceTraveled + horizontalDistance;

            xChange = horizontalDistance * cos(currentSlopeAngel*pi/180);
            
            currentPosition = currentPosition + xChange;
        
            input = [currentSpeed/maxSpeed;currentSlopeAngel/maxSlopeAngle;currentBrakeTemperature/maxTemperature];
            output = FFNN(input,wIH,wHO);
    
            breakingPressure = output(1);
            gearChange = output(2);
      
            
            if timeBetweenGearChange >= 2
                timeBetweenGearChange = 0;
                if gearChange > 0.7
                    if gear == 10
                        gear = 10;
                    else
                        gear = gear + 1;
                    end
                elseif gearChange < 0.3
                    if gear == 1
                        gear = 1;
                    else
                        gear = gear - 1;
                    end
                else
                end
            else
            end

    
            % Update parameters 

        
            
            [speed, brakingTemperature] = TruckModel(currentSpeed,currentSlopeAngel,breakingPressure,currentBrakeTemperature,gear,deltaT);
            
            totalSpeed = totalSpeed + currentSpeed;
            averageSpeed = totalSpeed/numberOfUpdates;
            if speed > maxSpeed || speed < minSpeed || brakingTemperature > maxTemperature || distanceTraveled > slopeLength 
                fitnessListPerSlope(i) = averageSpeed * distanceTraveled;
                break
            else   
                timeBetweenGearChange = timeBetweenGearChange + deltaT;
                currentSpeed = speed;
                currentBrakeTemperature = brakingTemperature;
            end
        end
    end
    fitness = mean(fitnessListPerSlope);
end

