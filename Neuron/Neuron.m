classdef Neuron < handle
    %NEURON Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        firingRate = 10;     % firing rate (in Hz - cycles per second)
    end
    
    methods
        % constructor
        function obj = Neuron(firingRate)
            if nargin > 0 
                obj.firingRate = firingRate;
            end
        end        
    end
    
end

