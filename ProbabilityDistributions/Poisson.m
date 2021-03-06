classdef Poisson < handle
    %POISSON Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        lambda = 1;     % parameter
        e = exp(1);     % e, Euler's number
        k = 1;          % number of events
        K;              % vector of k's
        mu;
        var;            % Poisson => mu = var
        pdf;
        plot;
    end
    
    methods
        function p = Poisson(lambda, k)
            if nargin > 0 p.lambda = lambda;    end
            if nargin > 1 p.k = k;              end
        end

        function computePdf(p)
            p.K = 0:1:10;
            p.pdf = poisspdf(p.K,p.lambda);            
        end
        
        % computePmf_didactic spells out formula
        function computePdf_didactic(p)
            p.K = 0:1:10;
            p.pmf = p.lambda .^ p.K .*  p.e .^ -p.lambda ./ factorial(p.K);
            disp(p.pmf);           
        end
        
        function makePlot(p)
            p.plot = Plot(p.K, p.pmf);
        end
            
    end
    
end