% nIn = the number of inputs
% nHidden = the number of hidden neurons
% nOut = the number of output neurons
% Weights (and biases) should take values in the range [-wMax,wMax]

function [wIH, wHO] = DecodeChromosome(chromosome, nIn, nHidden, nOut, wMax)
    flattenwIH = chromosome(1:nHidden*(nIn+1));
    flattenwHO = chromosome(nHidden*(nIn+1)+1:length(chromosome));

    flattenwIH = -wMax + (2*wMax.*flattenwIH);
    flattenwHO = -wMax + (2*wMax.*flattenwHO);

    wIH = reshape(flattenwIH,[(nIn+1),nHidden])';
    wHO =  reshape(flattenwHO,[(nHidden+1),nOut])';
   
end