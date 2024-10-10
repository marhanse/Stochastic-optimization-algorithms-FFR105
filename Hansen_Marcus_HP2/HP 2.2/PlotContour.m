function PlotContour(x1Star,x2Star, xMax, xMin)

    objectiveFunction = @(x1, x2) (x1.^2 + x2 - 11).^2 + (x1 + x2.^2 - 7).^2;
    
    x1_range = linspace(xMin, xMax, 100); 
    x2_range = linspace(xMin, xMax, 100); 
    
    [x1_grid, x2_grid] = meshgrid(x1_range, x2_range);
    
    f_values = objectiveFunction(x1_grid, x2_grid);
    
    a = 0.01;
    
    log_values = log(a + f_values);
   
    contour(x1_grid, x2_grid, log_values, 20); 
    title('Contour Plot of log(a + f(x1, x2))');
    xlabel('x1');
    ylabel('x2'); 
    
    colormap('jet'); 
    
    hold on
    scatter(x1Star, x2Star, 'ro', 'filled');
    legend('Contour', 'Minima')
    
    grid on;
    hold off
end