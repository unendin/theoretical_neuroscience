classdef Parameters < handle
    %PARAMETERS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        % TimeSeries
        tSpan = 10;
        dt = .001;
        
        % Input
        
        % Output
        output = 'PoissonProcess';
               
        % Neuron
        firingRate = 10;
        
    end
    
    methods
        % constructor
        function obj = Parameters()
        end
    end
    
end

