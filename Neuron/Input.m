classdef Input < handle
    %INPUT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        timeSeries;
    end
    
    methods
        % Constructor
        function obj = Input(params)
            
            % Generate time series
            obj.timeSeries = TimeSeries(params.tSpan, params.dt);
            
            % Populate with current simulated as:
            %   I(t) = I(0) + I_amps * sin(I_ohms) + jitter
            obj.timeSeries.T(2,:) = params.I_0 + ...         
                params.I_amps * sin(params.I_ohms * obj.timeSeries.n) + ... 
                random('norm',0,params.I_sigma, [1,obj.timeSeries.n]);
        end        
        

    end
    
end

