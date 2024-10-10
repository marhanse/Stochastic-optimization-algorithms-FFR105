

function alpha = GetSlopeAngle(x, iSlope, iDataSet)

if (iDataSet == 1) % Training 
        
    if (iSlope == 1) 
        alpha =4 + sin(x/100) + cos(sqrt(2.25)*x/50);   
    elseif (iSlope == 2)
        alpha = 4 + sin(x/67.89) + cos(sqrt(2.75)*x/50);
    elseif (iSlope == 3)
        alpha = 4 + sin(x/45.12) + cos(sqrt(1.65)*x/100);
    elseif (iSlope == 4)
       alpha = 5 + sin(x/50) + cos(sqrt(3.25)*x/50);
    elseif (iSlope == 5)
        alpha = 4 + sin(x/52.34) + cos(sqrt(1.75)*x/80);
    elseif (iSlope == 6)
        alpha =4 + sin(x/60) + cos(sqrt(2.15)*x/60);
    elseif (iSlope == 7)
        alpha = 4 + sin(x/150) + cos(sqrt(2.85)*x/40);
    elseif (iSlope == 8)
        alpha = 4 + sin(x/29.87) + cos(sqrt(2.45)*x/50);
    elseif (iSlope == 9)
        alpha =5 + sin(x/77.23) + cos(sqrt(2.95)*x/55);
    elseif (iSlope == 10)
        alpha =4  + sin(x/36.54) + cos(sqrt(2.35)*x/35);
    end

elseif (iDataSet == 2)                            % Validation
 if (iSlope == 1) 
   alpha = 5 + sin(x/61.89) + cos(sqrt(2.65)*x/65);    % You may modify this!

 elseif (iSlope == 2) 
     alpha = 4 + sin(x/8.88) + cos(sqrt(2.05)*x/70);
 elseif (iSlope == 3)
     alpha = 4 + sin(x/82.37) + cos(sqrt(2.45)*x/40);
 elseif (iSlope == 4)
     alpha =5 + sin(x/27.64) + cos(sqrt(2.75)*x/75);
 elseif (iSlope == 5) 
   alpha = 4 + sin(x/70.23) + cos(sqrt(2.15)*x/90);   % You may modify this!
 end 
elseif (iDataSet == 3)                           % Test
 if (iSlope == 1) 
     alpha = 4 + (x/1000) + sin(x/70) + cos(sqrt(7)*x/100);
 elseif (iSlope == 2)
    alpha = 4 + sin(x/59.73) + cos(sqrt(2.35)*x/80);
 elseif (iSlope == 3)
    alpha = 4 + sin(x/92.56) + cos(sqrt(2.65)*x/95);
 elseif (iSlope == 4)
    alpha = 4 + sin(x/19.84) + cos(sqrt(2.55)*x/25);
 elseif (iSlope == 5)
   alpha = 6 - sin(x/100) - cos(sqrt(7)*x/50); % You may modify this!
 end
end
