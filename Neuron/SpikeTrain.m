classdef SpikeTrain < TimeSeries
    %SPIKETRAIN Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        neuron = Neuron();
        spikes;
    end
    
    methods
        % constructor
        function s = SpikeTrain(neuron, tspan, dt)
            if nargin < 3 
               tspan = 10;
               dt = .001;
            end
            s = s@TimeSeries(tspan, dt);
            
            if nargin > 0 
                s.neuron = neuron;    
            end
            
            s.T(2,:) = random('uniform',0,1,[1,s.n]);
            s.T(3,:) = s.T(2,:) < (neuron.rate * s.dt);
            s.spikes = s.T(3,:) * ones(s.n,1);
        end
        
        function makePlot(s)
            % Plot times against spike points
            plot = Plot(s.T(1,:), s.T(3,:));

        end
    end
    
end

