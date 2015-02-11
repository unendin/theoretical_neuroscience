
%% TODO
% build unit test (as basis also for perf?)
% interleave and iterate method calls

% instantiate performance object with class and method
meanPerf = performance('A', 'computeMean');

% generate input to computeMean
newGaussian = gaussian(0,1);
newGaussian.dim = [1 100000];
newGaussian.generate();

% instantiate class performance object
meanPerf.instantiate(newGaussian.rand);

% call and time method
meanPerf.timeMethod();

% repeat for mean
meanPerf2 = performance('A', 'computeMean_didactic');

newGaussian2 = gaussian(0,1);
newGaussian2.dim = [1 100000];
newGaussian2.generate();

meanPerf2.instantiate(newGaussian2.rand);

meanPerf2.timeMethod();