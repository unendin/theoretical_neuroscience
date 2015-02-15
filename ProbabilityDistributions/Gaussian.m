classdef Gaussian < handle
    %GAUSSIAN Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        mu = 0;     % mean
        sigma = 1   % standard deviation
        dim         % matrix dimensions for rand number generation
        rand        % randomly generated numbers
    end 
    
    methods
        % constructor
        function obj = Gaussian(mu, sigma)
            if nargin > 0 obj.mu = mu;          end
            if nargin > 1 obj.sigma = sigma;    end
        end
        
        function set.dim(obj, dim)
            obj.dim = dim;
        end
        
        function generate(obj)
            obj.rand = normrnd(obj.mu, obj.sigma, obj.dim);
        end
        
    end
    
end

