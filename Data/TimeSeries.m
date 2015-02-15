classdef TimeSeries < handle
    %TIMESERIES Experimenting with built-in and custom timeseries object
    
    properties
        tSpan = 10;
        dt = .001;
        n
        T
    end
    
    methods
        function obj = TimeSeries(tSpan, dt)
            if nargin > 0 obj.tSpan = tSpan;    end
            if nargin > 1 obj.dt = dt;          end
            
            obj.T = 0:obj.dt:obj.tSpan;
            obj.n = length(obj.T);
        end       
    end
end

