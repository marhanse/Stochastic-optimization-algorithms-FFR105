% This method should plot the polynomial and the iterates obtained
% using NewtonRaphsonStep (if any iterates were generated).

function PlotIterations(polynomialCoefficients, iterationValues)
        xPlotValues = linspace(min(iterationValues)-std(iterationValues), max(iterationValues)+ std(iterationValues), 1000);
        yPlotValues = zeros(size(xPlotValues));
        fValues = zeros(size(iterationValues));

        for i = 1:length(xPlotValues)
            yPlotValues(i) = GetPolynomialValue(xPlotValues(i), polynomialCoefficients); 
        end

        hold on 
        plot(xPlotValues,yPlotValues)

        for i = 1:length(iterationValues)
            fValues(i) = GetPolynomialValue(iterationValues(i), polynomialCoefficients); 
        end

        plot(iterationValues,fValues,'o')
        hold off
end