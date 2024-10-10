function chromosome = EncodeNetwork(wIH, wHO, wMax)

    flattenwIH = (reshape(wIH.', 1, []));
    flattenwH0 = (reshape(wHO.', 1, []));

    flattenwIH = (flattenwIH + wMax)./(2*wMax);
    flattenwH0=(flattenwH0 + wMax)./(2*wMax);

    chromosome = [flattenwIH flattenwH0];
   
    
end