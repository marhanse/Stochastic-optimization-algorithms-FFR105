function [speed, brakingTemperature] = TruckModel(currentSpeed,slopeAngel,breakPressure,brakingTemperature,gear,deltaT)
    truckMass = 20000;
    maxTemperature = 750; 
    gravity = 9.81;
    gravityForce = truckMass*gravity*sin(slopeAngel*pi/180);
    tau = 30;
    ch = 40;
    cb = 3000;
    ambientTemperature = 283;
    deltaBrakeTemperature = brakingTemperature - ambientTemperature;

    if brakingTemperature < (maxTemperature -100)
        brakingForce = truckMass*gravity*breakPressure/20;
    else
        brakingForce = truckMass*gravity*breakPressure*exp(-(brakingTemperature-(maxTemperature-100))/100)/20;
    end

    if breakPressure < 0.01
        deltaTemperature = -deltaBrakeTemperature/tau*deltaT;
    else
        deltaTemperature = ch*breakPressure*deltaT;
    end

    newBrakeTemperature = brakingTemperature + deltaTemperature;

    % Never fall below ambient
    brakingTemperature = max(newBrakeTemperature, ambientTemperature);

    engineBrakePerGear = [7.0*cb, 5.0*cb, 4.0*cb,3.0*cb,2.5*cb,2.0*cb,1.6*cb,1.4*cb,1.2*cb,cb];
    
    engineForce = engineBrakePerGear(gear);

    speed = (deltaT*(gravityForce-brakingForce-engineForce)/truckMass) + currentSpeed;
    
end

