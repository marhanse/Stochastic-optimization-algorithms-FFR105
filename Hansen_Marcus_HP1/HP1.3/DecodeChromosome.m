% Note: Each component of x should take values in [-a,a], where a = maximumVariableValue.

function x = DecodeChromosome(chromosome,numberOfVariables,maximumVariableValue)
    m = size(chromosome,2);
    n = numberOfVariables;
    k = fix(m/n);

    x(1) = 0;
    for i = 1:k
        x(1) = x(1) + 2^(-i) * chromosome(i);
    end
    x(1) = (x(1) * 2*maximumVariableValue/(1-2^(-k))) - maximumVariableValue;

    x(2) = 0;
    for j = 1:k
        x(2) = x(2) + 2^(-j) * chromosome(j+k);
    end
    x(2) = (x(2) * 2 * maximumVariableValue/(1-2^(-k))) - maximumVariableValue;
end