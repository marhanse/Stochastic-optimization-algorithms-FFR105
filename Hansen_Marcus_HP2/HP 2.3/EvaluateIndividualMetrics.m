function [distanceTraveled,gearChanges,slopeAngles,breakPreassures,speedChanges,brakeTemperatures,xPositionsDuringSlope]  = EvaluateIndividualMetrics(wIH, wHO,set,slope)

    % Initial values for the truck 
    
    maxSlopeAngle = 10; 
    maxSpeed = 25;
    minSpeed = 1;
    startSpeed = 20;
    gear = 7;
    maxTemperature = 750;
    deltaT = 0.20;
    slopeLength = 1000;
    startPosition = 0;
    startBrakingTemperature = 500;
        
    distanceTraveled = 0;
    currentPosition = startPosition;
    currentBrakeTemperature = startBrakingTemperature;
    currentSpeed = startSpeed;
    timeBetweenGearChange = 2;
    numberOfUpdates = 0;

    gearChanges = [gear];
    slopeAngles = [];
    breakPreassures = [];
    speedChanges = [currentSpeed];
    brakeTemperatures = [startBrakingTemperature];
    xPositionsDuringSlope = [startPosition];
    
    while true
        numberOfUpdates = numberOfUpdates + 1;
        currentSlopeAngel = GetSlopeAngle(currentPosition,slope,set);
        slopeAngles = [slopeAngles,currentSlopeAngel];
        horizontalDistance = currentSpeed * deltaT;
        distanceTraveled = distanceTraveled + horizontalDistance;

        xChange = horizontalDistance * cos(currentSlopeAngel*pi/180);
        
        currentPosition = currentPosition + xChange;
    
        input = [currentSpeed/maxSpeed;currentSlopeAngel/maxSlopeAngle;currentBrakeTemperature/maxTemperature];
        output = FFNN(input,wIH,wHO);

        breakingPressure = output(1);
        gearChange = output(2);

        breakPreassures = [breakPreassures, breakingPressure];

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

        
        [speed, brakingTemperature] = TruckModel(currentSpeed,currentSlopeAngel,breakingPressure,currentBrakeTemperature,gear,deltaT);
        
        
        if speed > maxSpeed || speed < minSpeed || brakingTemperature > maxTemperature || distanceTraveled > slopeLength 
            break
        else   
            timeBetweenGearChange = timeBetweenGearChange + deltaT;
            currentSpeed = speed;
            currentBrakeTemperature = brakingTemperature;
            gearChanges = [gearChanges, gear];
            speedChanges = [speedChanges, currentSpeed];
            brakeTemperatures = [brakeTemperatures, currentBrakeTemperature];
            xPositionsDuringSlope = [xPositionsDuringSlope, horizontalDistance];

        end
    end
end