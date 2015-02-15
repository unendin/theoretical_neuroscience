classdef Spikes_LIF < Spikes
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
        function obj = Spikes_LIF(params)
            
            % Call superclass constructor
            obj = obj@Spikes(params);
            
            % Generate vector of current input
            input = Input(params);
            obj.timeSeries.T(2,:) = input.timeSeries.T(2,:);
            
            % Set initial voltage
            obj.timeSeries.T(3,1) = params.V_0;
            
            % Compute differential equation mapping input to voltage
            for t = 1:obj.timeSeries.n - 1
                
                % Euler integration
                obj.timeSeries.T(3,t+1) = obj.timeSeries.T(3,t) + ...
                    params.dt * (-obj.timeSeries.T(3,t)/params.tau ...
                    + obj.timeSeries.T(2,t)); 
               
                %checking if the neuron crossed threshold
                if obj.timeSeries.T(3,t+1) > params.V_thresh 
                
                    % neuron fired!
                    % save the spike time
                    obj.timeSeries.T(4,t+1) = 1;
                    obj.timeSeries.T(3,t+1) = params.V_reset; %reset the voltage to V_reset
                end
            end
        end
        
        function makePlot(obj)
            % Plot times against spike points
            obj.plot = Plot(obj.timeSeries.T(1,:), obj.timeSeries.T(4,:));
        end

        function computeSummary(obj)
                        
            % Row of spike indicators * col of 1s
            obj.numSpikes = obj.timeSeries.T(4,:) * ones(obj.timeSeries.n,1);
            
            % timespan divide ny n_spiikes
            obj.mu_isi = obj.timeSeries.tSpan / obj.numSpikes; 
            
        end        
    end   
end

