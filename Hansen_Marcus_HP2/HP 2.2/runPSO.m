%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Particle Swarm Optimization (PSO)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;
tic
format long

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
numberOfParticles = 20;  
numberOfdimensions = 2;
xMax = 5;        
xMin = -5;         
alpha = 1;          
deltaT = 1;  
c1 = 2;
c2 = 2;
initialInertia = 1.4;
minimumIneria = 0.3;
beta = 0.9999;
runs = 10000;
times = 10;
maxVelocity = (xMax-xMin)/deltaT;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x1 = zeros(1,times);
x2 = zeros(1,times);
for time = 1:times
    
    particlePositions = InitializePositions(xMax,xMin,numberOfParticles,numberOfdimensions);
    particleVelocities = InitializeVelocity(xMax,xMin,numberOfParticles,numberOfdimensions,alpha,deltaT);
    
    particleBestPositions = zeros(size(particlePositions));
    particleBestPositionValues = Inf(size(particleBestPositions,1),1);
    bestSwarmPosition = zeros(1,2);
    bestSwarmValue = Inf(1);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % main loop 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    for i = 1:runs
        [particleBestPositions, particleBestPositionValues]= BestPosition(particlePositions, particleBestPositions, particleBestPositionValues);
        [bestSwarmPosition, bestSwarmValue]= BestSwarm(particlePositions, bestSwarmPosition, bestSwarmValue);
        particleVelocities = UpdateVelocity(particleVelocities,particlePositions,particleBestPositions,bestSwarmPosition,c1,c2,deltaT,initialInertia,maxVelocity);
        particlePositions = UpdatePosition(particlePositions,particleVelocities);
        if initialInertia > minimumIneria
            initialInertia = beta*initialInertia;
        end
    end
    
    x1(time) = bestSwarmPosition(1);
    x2(time) = bestSwarmPosition(2);
    disp('Position of local minimum')
    disp(bestSwarmPosition)
    disp('Function value')
    disp(bestSwarmValue)
    hold on 
end

PlotContour(x1, x2,xMax,xMin)
toc