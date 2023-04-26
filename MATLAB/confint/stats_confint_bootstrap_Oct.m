%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Confidence intervals
%    VIDEO: Bootstrapping confidence intervals
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
sampledata  = population(randSamples);
samplemean  = mean(sampledata);
samplestd   = std(population(randSamples)); % used later for analytic solution


%%% now for bootstrapping
numBoots  = 1000;
bootmeans = zeros(numBoots,1);

% resample with replacement
for booti=1:numBoots
    bootmeans(booti) = mean( randsample(sampledata,samplesize,true) );
end

% find confidence intervals
confint(1) = prctile(bootmeans,(100-confidence)/2);
confint(2) = prctile(bootmeans,100-(100-confidence)/2);

%% graph the outcomes

figure(2), clf, hold on

% start with a histogram of the resampled means
[y,x] = hist(bootmeans,40);
y=y./max(y);
bar(x,y)

% then the same stuff as in the previous code-video...
patch(confint([1 1 2 2]),[0 1 1 0],'g','edgecolor','none')
plot([1 1]*popMean,[0 1.5],'k:','linewidth',2)
plot([1 1]*samplemean,[0 1],'r--','linewidth',3)
set(gca,'xlim',[popMean-30 popMean+30],'ytick',[])
xlabel('Data values')
legend({'Empirical distribution';[ num2str(confidence) '% CI region' ];'True mean';'Sample mean'})

%% compare against the analytic confidence interval

% compute confidence intervals
citmp = (1-confidence/100)/2;
confint2 = samplemean + tinv([citmp 1-citmp],samplesize-1) * samplestd/sqrt(samplesize);

fprintf('\n Empirical: %g - %g',round(confint*100)/100)
fprintf('\n Analytic:  %g - %g\n',round(confint2*100)/100)

%% done.
