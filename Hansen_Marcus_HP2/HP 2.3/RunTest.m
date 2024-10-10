%%%%%%%%%%%%%%%%%%%%%
%   Test Program
%%%%%%%%%%%%%%%%%%%%%

bestChromosome = BestChromosome;
inputNeurons = 3;
hiddenNeurons = 4;   
outputNeurons = 2;
slope = 1;
set = 3;
wMax = 5;

[wIH,wHO] = DecodeChromosome(bestChromosome,inputNeurons,hiddenNeurons,outputNeurons,wMax);
[distanceTraveled,gearChanges,slopeAngles,breakPreassures,speedChanges,brakeTemperatures,xPositionsDuringSlope]  = EvaluateIndividualMetrics(wIH, wHO,set,slope);

distanceTraveled = linspace(0,distanceTraveled,length(gearChanges));

subplot(5, 1, 1);
plot(distanceTraveled, gearChanges, 'b');
ylabel('Gear Changes');
xlabel('x Positions During Slope');
title('Gear Changes');

% Plot slopeAngles
subplot(5, 1, 2);
plot(distanceTraveled, slopeAngles, 'g');
ylabel('Slope Angles');
xlabel('x Positions During Slope');
title('Slope Angles');

subplot(5, 1, 3);
plot(distanceTraveled, breakPreassures, 'r');
ylabel('Brake Pressures');
xlabel('x Positions During Slope');
title('Brake Pressures');

subplot(5, 1, 4);
plot(distanceTraveled, speedChanges, 'c');
ylabel('Speed Changes');
xlabel('x Positions During Slope');
title('Speed Changes');

subplot(5, 1, 5);
plot(distanceTraveled, brakeTemperatures, 'm');
ylabel('Brake Temperatures');
xlabel('x Positions During Slope');
title('Brake Temperatures');
