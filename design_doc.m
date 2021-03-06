%% TIME SERIES DIMENSIONS
% Each SpikeModel has a TimeSeries class and generates layers of time
% series data:
%
% # Time steps -- generated by TimeSeries constructor
% # Noise -- Uniform (poisson), Gaussian (LIF)
% # Current -- in LIF 
% # Voltage  -- in LIF
% # Spikes
%
% Define in Spike Model (abstractly)
% Implement in subclasses
% Plot
% Summarize



%% Generate poisson spike train simulation
clear;
import SpikeModels.*
% default param object
params = Parameters;
simulation = PoissonProcess(params);
simulation.computeSummary(params);
simulation.computeMll(params);
fig = Figure(simulation, params);

%% Generate leaky integrate and fire (LIF) spike train simulation
clear;
% default param object
params = Parameters;
simulation = SpikeModel_LIF(params);
simulation.makePlot;
simulation.computeSummary;

%% Plot poisson pdf
clear;
% using defaults ...
poisson = Poisson();
poisson.computePdf();
poisson.makePlot();
