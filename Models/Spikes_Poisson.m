classdef Spikes_Poisson < Spikes
    % PoissonProcess
    %   Detailed explanation goes here
    
    properties
        numSpikes;
        mu_isi;         % mean inter-spike interval 
        var_isi;
        plot;
    end
    
    methods
        % Constructor
        function obj = Spikes_Poisson(params)
            
             obj = obj@Spikes(params);
            
            % Generate vector of uniform random numbers 0-1 same length as T
            obj.timeSeries.T(2,:) = random('uniform',0,1,[1,obj.timeSeries.n]);
            
            % Spike occurs when number < rate * dt
            obj.timeSeries.T(3,:) = obj.timeSeries.T(2,:) < ...
                (obj.neuron.firingRate * obj.timeSeries.dt);
        end
        
        function makePlot(obj)
            % Plot times against spike points
            obj.plot = Plot(obj.timeSeries.T(1,:), obj.timeSeries.T(3,:));
        end

        function computeSummary(obj)
                        
            % Row of spike indicators * col of 1s
            obj.numSpikes = obj.timeSeries.T(3,:) * ones(obj.timeSeries.n,1);
            
            % timespan divide ny n_spiikes
            obj.mu_isi = obj.timeSeries.tSpan / obj.numSpikes; 
            
        end        
    end   
end

