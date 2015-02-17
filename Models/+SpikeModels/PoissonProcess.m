classdef PoissonProcess < SpikeModels.SpikeModelBase
    % SpikeModel_Poisson
    
    properties
                theta;
            fval;
            exitflag;
            output;
            grad;
            hessian;
        
    end
    
    methods
        %% Constructor
        function obj = PoissonProcess(params)
            
            % Call superclass constructor with params argument to
            % initialize initialize appropriate TimeSeries (tSpan, dt) and
            % Neuron (firingRate)
            obj = obj@SpikeModels.SpikeModelBase(params);
            
            % Compute noise dimension of TimeSeries
            obj.computeNoise;
            
            % Compute spike dimension of TimeSeries
            obj.computeSpikes;            
        end

        %% computeLikelihood
        function computeMll(obj, params)
            theta0 = 1 * params.dt;
            
            [theta,fval,exitflag,output,grad,hessian] = ...
                fminunc(@(x) poissonMll(x,obj.timeSeries.T(4,:)),theta0);
            
            obj.theta = theta / params.dt;
            obj.fval  = fval;
            obj.exitflag = exitflag;
            obj.output = output;
            obj.grad = grad;
            obj.hessian = hessian;
                        
        end           
        
        %% computeNoise
        function computeNoise(obj)
            
            % Generate vector of uniform random numbers 0-1 same length as T
            obj.timeSeries.T(2,:) = random('uniform',0,1,[1,obj.timeSeries.n]);
            
        end        
        
        %% computeSpikes
        function computeSpikes(obj)
            
            % Spike occurs when number < rate * dt
            obj.timeSeries.T(4,:) = obj.timeSeries.T(2,:) < ...
                (obj.neuron.firingRate * obj.timeSeries.dt);
            
        end              
        
    end   
end

