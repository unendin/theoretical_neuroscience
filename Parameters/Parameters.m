classdef Parameters < handle
    %PARAMETERS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        % TimeSeries
        tSpan = 10;
        dt = .001;
        
        % Input current
        I_0     = 0;            % Input at t=0 
        I_amps  = 100;          % Aamps
        I_ohms  = 2 * pi * 10;  % Ohms
        I_sigma = 150;          % SD        
                       
        % Neuron
        firingRate = 10;
        V_0 = 0;
        V_thresh = 1;
        V_reset = -0.2;
        tau = 15e-3;
             
    end
    
    methods
        % constructor
        function obj = Parameters()
        end
    end
    
end

