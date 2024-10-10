function output = FFNN(input,wIH,wHO)

    biasIH = wIH(:, end); 
    biasHO = wHO(:, end);  
    wIH = wIH(:, 1:end-1);
    wHO = wHO(:, 1:end-1);
    localField1 = wIH * input + biasIH;
    hiddenLayerOutput = logisticSigmoid(localField1);
    localField2 = wHO * hiddenLayerOutput + biasHO;
    output = logisticSigmoid(localField2);
end


function activationValues = logisticSigmoid(state)  
    c = 1;
    activationValues = 1./(1+exp(-c.*state));
end

