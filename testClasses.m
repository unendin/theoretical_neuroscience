%% Poisson
clear;
poisson = Poisson();
poisson.computePdf();
poisson.makePlot();

%% Generate simple poisson spike train
clear;
T = 0:1:999
rand = random('uniform', 0, 1, [1,1000])
n = length(T);
r = 10;
for i = 1:1000
    if rand(i) <= r * 1/n
        fprintf('yes')
    end
end

%% Generate simple poisson spike train
clear;

% Instantiate neuron with rate (in Hz)
neuron = Neuron(1);

% verify rate
neuron.rate

% instantiate spike train with neuron and default tspan & dt inherited
% from its superclass TimeSeries
spikeTrain = SpikeTrain(neuron); 

% plot using 
spikeTrain.makePlot();