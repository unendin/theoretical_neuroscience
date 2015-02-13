classdef TimeSeries
    %TIMESERIES Experimenting with built-in and custom timeseries object
    
    properties
        tspan = 10;
        dt = .001;
        n
        T
    end
    
    methods
        function ts = TimeSeries(tspan, dt)
            if nargin > 0 ts.tspan = tspan;    end
            if nargin > 1 ts.dt = dt;          end
            
            ts.T = 0:ts.dt:ts.tspan;
            ts.n = length(ts.T);
        end       
    end
    
end

