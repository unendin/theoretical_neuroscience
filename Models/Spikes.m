classdef Spikes < handle
    %SPIKINGNEURON Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        timeSeries;
        neuron;
    end
    
    methods
        % Constructor
        function obj = Spikes(params)
                    
            % Create time series
            obj.timeSeries = TimeSeries(params.tSpan, ...
                                        params.dt);
            
            % Create neuron
            obj.neuron = Neuron(params.firingRate);
                    
        end  
    end
    
end

