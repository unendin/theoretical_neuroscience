classdef Input
    %INPUT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        I;
        I_0 = 0;
        A = 100;                    % Amps?
        ohms_I = 2 * pi * 10;
        sigma_I = 150;              % SD
        T = 1;                      % total time
        dt = 2e-4;                  % timestep
        times;                      % Vector of time
        n_times; % Number of timesteps
    end
    
    methods
        % constructor
        function obj = Input()
          obj.times = 0:obj.dt:obj.T;
          obj.n_times = numel(obj.times)
          obj.I = obj.I_0 + obj.A * sin(obj.ohms_I * obj.times) + ...
              random('norm',0,obj.sigma_I,[1,obj.n_times]);
        end        
        

    end
    
end

