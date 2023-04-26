%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Confidence intervals
%    VIDEO: Compute confidence intervals by formula
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc
pkg load statistics % load Octave stats package

%% simulate data

popN = 1e7; % lots and LOTS of data!!

% the data (note: non-normal!)
population = (4*randn(popN,1)).^2;

% we can calculate the exact population mean
popMean = mean(population);

% let's see it
figure(1), clf
subplot(211)
% only plot every 1000th sample
plot(population(1:1000:end),'ks')
xlabel('Data index'), ylabel('Data value')

subplot(212)
hist(population,40)
ylabel('Count'), xlabel('Data value')

%% draw a random sample

% parameters
samplesize = 40;
confidence = 95; % in percent

% compute sample mean
randSamples = randi(popN,samplesize,1);
samplemean  = mean(population(randSamples));
samplestd   = std(population(randSamples));

% compute confidence intervals
citmp = (1-confidence/100)/2;
confint = samplemean + tinv([citmp 1-citmp],samplesize-1) * samplestd/sqrt(samplesize);


% graph everything
figure(2), clf, hold on
patch(confint([1 1 2 2]),[0 1 1 0],'g','edgecolor','none')
plot([1 1]*popMean,[0 1.5],'k:','linewidth',2)
plot([1 1]*samplemean,[0 1],'r--','linewidth',3)
set(gca,'xlim',[popMean-30 popMean+30],'ytick',[])
xlabel('Data values')
legend({[ num2str(confidence) '% CI region' ];'True mean';'Sample mean'})

%% repeat for large number of samples

% parameters
samplesize = 50;
confidence = 95; % in percent
numExperiments = 5000;

withinCI = zeros(numExperiments,1);


% part of the CI computation can be done outside the loop
citmp = (1-confidence/100)/2;
CI_T  = tinv([citmp 1-citmp],samplesize-1);
sqrtN = sqrt(samplesize);

for expi=1:numExperiments
    
    % compute sample mean and CI as above
    randSamples = ceil(popN*rand(samplesize,1));
    samplemean  = mean(population(randSamples));
    samplestd   = std(population(randSamples));
    confint     = samplemean + CI_T * samplestd/sqrtN;
    
    % determine whether the True mean is inside this CI
    if popMean>confint(1) && popMean<confint(2)
        withinCI(expi) = 1;
    end
end

fprintf('%g%% of sample C.I.''s contained the true population mean.\n',100*mean(withinCI))

%% done.
