classdef Figure < handle
    %FIGURE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        tableData;
    end
    
    methods
        
        % Constructor
        function obj = Figure(simulation, params)
            
            % Get screen size
            scrsz = get(groot,'ScreenSize');
            
            % Set figure size 
            f = figure('Visible','off','Position',[1 scrsz(4) scrsz(3) scrsz(4)]);

            %% PLOT LAYOUT
            plot_hgap = .02;
            plot_vgap = .1;
            
            %% PLOT NOISE
            % Set plot position [left,bottom,width,height]
            positionVector1 = [plot_hgap, 0 + plot_vgap, .5 - 2*plot_hgap, .5 - 2*plot_vgap]; 
            subplot('Position',positionVector1);
            simulation.makePlot('noise');
            title('Noise');            
            
            %% PLOT SPIKES
            % Set plot position [left,bottom,width,height]
            positionVector2 = [.5 + plot_hgap, 0 + plot_vgap, .5 - 2*plot_hgap, .5 - 2*plot_vgap];
            subplot('Position',positionVector2);
            simulation.makePlot('spikes');
            title('Spikes');
            
            
            %% DISPLAY STATS
            rowNames = {'Number', 'Mean Hz', 'ISI Mean', 'ISI Var', 'Theta', 'Fval', 'Grad', 'Hessian'};
            colNames = {'Observed', 'Expected'};
            
            obj.tableData = { simulation.numSpikes (params.firingRate * params.tSpan); ...
                  simulation.hz params.firingRate; ...
                  simulation.isi_mu (1/params.firingRate);...
                  simulation.isi_var (1/params.firingRate^2);...
                  simulation.theta 'Na';...
                  simulation.fval 'Na';...
                  simulation.grad 'Na';...
                  simulation.hessian 'Na'}
            

              
            for i=1:4
                
                panel(i) = uipanel('Parent',f,'Title','Spike Statistics','FontSize',12,...
              'Position',[(i-1)/4 .5 .25 .5]);
          
                t(i) = uitable('Parent', panel(i), ...
                               'data',obj.tableData, ...
                               'RowName',rowNames, ...
                               'ColumnName',colNames, ...
                               'Units','normalized', ...
                               'RowStriping', 'off' ...
                               ); 
                           
            end
            f.Visible = 'on';
        end        
        
    end
    
end

