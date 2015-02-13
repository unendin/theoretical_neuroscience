classdef OdeSolver < handle
    %OdeSolver. Methods for solving ordinary differential equations
    %   Currently implements only Forward Euler method
    
    properties
        f
        t
        tspan
        n
        dt
        y0
        y
        point
        points
    end
    
    methods
        % constructor
        function o = OdeSolver(f, tspan, dt, y0, point)
            o.f = f;                % function handle
            o.tspan = tspan;        % vector of timepoints % time anology restrictive?
            o.dt = dt;              % timestep
            o.t = 0:dt:tspan;       % vector of times
            o.n = length(o.t);      % number of times
            o.y0 = y0;              % value at t0
            o.point = point;        % value indicating point event
            o.points = false(1,n);  % logical array of points in time
        end
        
        % solve
        function solve(o)
            o.y(1) = o.y0;
            for i = 1:o.n,
                o.y(i+1) = o.y(i) + dt * f(o.t(i), o.y(i));
                if o.y(i+1) >= o.point
                    o.points(i) = 1;
                    o.y(i+1) = 0;
                end 
            end
        end
        
    end 
end
