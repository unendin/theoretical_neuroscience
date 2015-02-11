classdef A < handle
    
    properties
        el          % elements in array of data
        mu          % mean
    end
    
    methods
        % constructor
        function obj = A(el)
            if nargin > 0 obj.el = el;    end
        end
        
        % computeMean
        function computeMean(obj)
            obj.mu = mean(obj.el);   
        end          

        % computeMean_didactic
        function computeMean_didactic(obj)
            % sum A. divide by number of elements in A.
            obj.mu = sum(obj.el) / numel(obj.el);   
        end         
        
    end

    
end

