%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

         % LGP test program 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Parameters 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clf
clear
bestChromosome = BestChromosome;
functionData = LoadFunctionData;

operators = 4;
variableRegisters = 3;
constantRegisters = 3;
totalRegisters = variableRegisters + constantRegisters;
c1 = 1;
c2 = 2;
c3 = -1;
constants = [c1,c2,c3];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       Function plotting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xFunctionDataValues = functionData(:,1);
yFunctionDataValues = functionData(:,2);
yEstimatedValues = zeros(length(xFunctionDataValues),1);

for i = 1:length(xFunctionDataValues)
    yEstimatedValues(i) = ComputeYEstimate(xFunctionDataValues(i),bestChromosome,variableRegisters,constants);
end

fitness = EvaluateIndividual(functionData,bestChromosome,variableRegisters,constants);
error = 1/fitness; 

estimatedSymbolicFunction = SymbolicFunction(bestChromosome,variableRegisters,constants);

hold on
box on
figure(1)
plot(xFunctionDataValues,yFunctionDataValues,'o')
xlabel('x')
ylabel('y')
legend('Function Data Points')
figure(2)
plot(xFunctionDataValues,yEstimatedValues)
legend('The approximated function using LGP')
xlabel('x')
ylabel('y')
hold off 


disp('-------------------------------------')
fprintf('Error: %d', error)
disp(' ')
disp('-------------------------------------')
disp('-------------------------------------')
disp('Function found')
disp(' ')
disp(estimatedSymbolicFunction)
disp('-------------------------------------')


