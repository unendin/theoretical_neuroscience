classdef performance < handle
    %PERFORMANCE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        class       % class as handle
        instance    % instance of class        
        method      % method as string
        result
        telapsed    % elapsed time via tic toc
        
    end
    
    methods
        % constructor
        function obj = performance(class, method)
            if nargin > 0 obj.class = str2func(class);    end
            if nargin > 1 obj.method = method;         end
        end
        
        % instantiate
        function instantiate(obj, arg1)
            obj.instance = obj.class(arg1);
        end
        
        function timeMethod(obj)
            tstart = tic();
            obj.result = obj.class(obj.method);
            obj.telapsed = toc(tstart);
        end
    end
    
end

