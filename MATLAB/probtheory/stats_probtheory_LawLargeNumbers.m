%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Probability theory
%    VIDEO: The law of large numbers
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc

%% example with rolling a die

% die probabilities (weighted)
f1 = 2/8;
f2 = 2/8;
f3 = 1/8;
f4 = 1/8;
f5 = 1/8;
f6 = 1/8;

% confirm sum to 1
disp(f1+f2+f3+f4+f5+f6)

% expected value
expval = 1*f1 + 2*f2 + 3*f3 + 4*f4 + 5*f5 + 6*f6;

% generate "population"
population = [ 1 1 2 2 3 4 5 6 ];
for i=1:20
    population = [population population];
end

nPop = numel(population);

% draw sample of 8 rolls
sample = randsample(population,8);

%% experiment: draw larger and larger samples

k = 5000; % maximum number of samples
sampleAve = zeros(k,1);
for i=1:k
    idx = ceil(rand(1,i)*nPop);
    sampleAve(i) = mean( population(idx));
end


figure(1), clf, hold on
plot(sampleAve,'k')
plot([1 k],[1 1]*expval,'r','linew',4)
xlabel('Number of samples')
ylabel('Value')
set(gca,'ylim',[expval-1 expval+1])
legend({'Sample average';'expected value'})

% mean of samples converges to population estimate quickly:
mean(sampleAve)
mean(sampleAve(1:10))

%% Another example from a previous lecture (sampleVariability) (slightly adapted)

% generate population data with known mean
populationN = 1000000;
population = randn(populationN,1);
population = population - mean(population); % demean


% get means of samples
samplesize   = 30;
numberOfExps = 500;
samplemeans  = zeros(numberOfExps,1);

for expi=1:numberOfExps
    % get a sample and compute its mean
    sampleidx = randi(populationN,samplesize,1);
    samplemeans(expi) = mean(population( sampleidx ));
end


% show the results!
figure(2), clf
subplot(211), hold on
plot(samplemeans,'s-')
plot(get(gca,'xlim'),[1 1]*mean(population),'r','linew',3)
set(gca,'xlim',[1 numberOfExps])
xlabel('Experiment number')
ylabel('mean value')
legend({'Sample means';'Population mean'})

subplot(212), hold on
plot(cumsum(samplemeans') ./ (1:numberOfExps),'s-')
plot(get(gca,'xlim'),[1 1]*mean(population),'r','linew',3)
set(gca,'xlim',[1 numberOfExps],'ylim',[-.5 .5])
xlabel('Experiment number')
ylabel('mean value')
legend({'Sample means';'Population mean'})

%% some foreshadowing...

figure(3), clf
histogram(samplemeans,30)
xlabel('Sample mean value'), ylabel('Count')

%% done.
