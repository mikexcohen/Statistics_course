%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Probability theory
%    VIDEO: Sampling variability
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear

%% 

% a theoretical normal distribution
x = linspace(-5,5,10101);
theoNormDist = normpdf(x);
% normalize to pdf
% theoNormDist = theoNormDist*mean(diff(x));

% now for our experiment
numSamples = 40;

% initialize
sampledata = zeros(numSamples,1);

% run the experiment!
for expi = 1:numSamples
    sampledata(expi) = randn;
end

% show the results
figure(1), clf, hold on
histogram(sampledata,'Normalization','probability')
plot(x,theoNormDist,'r','linew',3)
xlabel('Data values'), ylabel('Probability')

%% show the mean of samples of a known distribution

% generate population data with known mean
populationN = 1000000;
population  = randn(populationN,1);
population  = population - mean(population); % demean


% now we draw a random sample from that population
samplesize = 30;

% the random indices to select from the population
sampleidx = randi(populationN,samplesize,1);
samplemean = mean(population( sampleidx ));

%%% how does the sample mean compare to the population mean?

%% repeat for different sample sizes

samplesizes = 30:1000;

samplemeans = zeros(size(samplesizes));

for sampi=1:length(samplesizes)
    
    % nearly the same code as above
    sampleidx = randi(populationN,samplesizes(sampi),1);
    samplemeans(sampi) = mean(population( sampleidx ));
end


% show the results!
figure(2), clf, hold on
plot(samplesizes,samplemeans,'s-')
plot(get(gca,'xlim'),[1 1]*mean(population),'r','linew',3)
xlabel('sample size')
ylabel('mean value')
legend({'Sample means';'Population mean'})

%% done.
