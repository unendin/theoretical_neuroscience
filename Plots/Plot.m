classdef Plot
    %PLOT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        X;
        Y
    end
    
    methods
        function p = Plot(X,Y)
            p.X = X;
            p.Y = Y;
            plot(p.X, p.Y);
        end
    end
    
end

