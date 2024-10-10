% This method should return the coefficients of the k-th derivative (defined by
% the derivativeOrder) of the polynomial given by the polynomialCoefficients (see also GetPolynomialValue)

function derivativeCoefficients = DifferentiatePolynomial(polynomialCoefficients, derivativeOrder)

    for i = 1:derivativeOrder
        polynomialOrders = 0:length(polynomialCoefficients)-1;
        derivativeCoefficients = polynomialCoefficients .* polynomialOrders;
        derivativeCoefficients = derivativeCoefficients(2:end);
        polynomialCoefficients = derivativeCoefficients;
    end
end