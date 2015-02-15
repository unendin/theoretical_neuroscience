%% Generate poisson spike train simulation
clear;
% default param object
params = Parameters;
simulation = Spikes_Poisson(params);
simulation.makePlot;
simulation.computeSummary;


%% Plot poisson pdf
clear;
% using defaults ...
poisson = Poisson();
poisson.computePdf();
poisson.makePlot();
