classdef LIF < SpikeModels.SpikeModelBase
    % PoissonProcess
    %   Detailed explanation goes here
    
    properties

    end
    
    methods
        % Constructor
        function obj = LIF(params)
            
            % Call superclass constructor
            obj = obj@SpikeModels.SpikeModelBase(params);
            
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
        
        %% computeNoise
        function computeNoise(obj)
            
            random('norm',0,params.I_sigma, [1,obj.timeSeries.n]
            
        end        
        
        %% computeSpikes
        function computeSpikes(obj)
            
            % Check if the neuron crossed threshold
            if obj.timeSeries.T(3,t+1) > params.V_thresh     
                % Neuron fired!
                % Save spike time
                obj.timeSeries.T(4,t+1) = 1;
                
                % Reset voltage to V_reset
                obj.timeSeries.T(3,t+1) = params.V_reset;
            end
        end 
        
        %% computeVoltage
        function computeVoltage(obj)

        end  
    end   
end

