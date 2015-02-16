classdef SpikeModelBase < handle
    %SpikeModelBase Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        
        % SpikeModel has-a TimeSeries
        timeSeries;  
        
        
        neuron;
        
        plot_noise;
        plot_spikes;
 
        numSpikes;
        hz;
        isi_vals;
        isi_mu;         % mean inter-spike interval 
        isi_var;       
    end
    
    methods
        % Constructor
        function obj = SpikeModelBase(params)
                    
            % Create time series
            obj.timeSeries = TimeSeries(params.tSpan, ...
                                        params.dt);
            
            % Create neuron
            obj.neuron = Neuron(params.firingRate);
                    
        end
        
        function makePlot(obj, dim)
            % Plot times against spike points
            if strcmp(dim, 'noise')
                obj.plot_noise = Plot(obj.timeSeries.T(1,:), obj.timeSeries.T(2,:));
            elseif strcmp(dim, 'spikes')
                obj.plot_spikes = Plot(obj.timeSeries.T(1,:), obj.timeSeries.T(4,:));
            end
        end
 

        function computeSummary(obj, params)
                        
            % Row of spike indicators * col of 1s
            obj.numSpikes = obj.timeSeries.T(4,:) * ones(obj.timeSeries.n,1);
            
            obj.hz = obj.numSpikes / params.tSpan;
            
            % timespan divide ny n_spiikes
            obj.isi_mu = obj.timeSeries.tSpan / obj.numSpikes; 
            
            
            idx = find( obj.timeSeries.T(4,:) == 1);
            obj.isi_vals = diff(idx) .* params.dt;
            obj.isi_var = sum((obj.isi_vals - obj.isi_mu).^2)/obj.numSpikes;
             
            
        end          
        
    end
    
end

