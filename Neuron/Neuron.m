classdef Neuron < handle
    %NEURON Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        rate = 10;     % firing rate (in Hz - cycles per second)
    end
    
    methods
        % constructor
        function n = Neuron(rate)
            if nargin > 0 
                n.rate = rate;
            end
        end        
    end
    
end

