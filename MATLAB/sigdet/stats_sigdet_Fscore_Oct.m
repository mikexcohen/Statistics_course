%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Signal detection theory
%    VIDEO: F-score
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc

%% run experiment

% number of 'trials' in the experiment
N = 50;

% number of experiment repetitions
numExps = 10000;

% initialize 
[Fscores,dPrimes,specificity] = deal(zeros(numExps,1));


%%% run the experiment!
for expi=1:numExps
    
    % generate data
    H = randi(N-1,1);  % hits
    M = N-H;           % misses
    CR = randi(N-1,1); % correction rejections
    FA = N-CR;         % false alarms
    
    % Fscore
    Fscores(expi) = H / (H+(FA+M)/2);
    
    % specificity
    specificity(expi) = CR/(CR+FA);
    
    % d'
    dPrimes(expi) = norminv(H/N)-norminv(FA/N);
    
    
    % not used here...
    accuracy  = (H+FA)/N;
    precision = H/(H+FA);
    recall    = H/(H+M);
end

% let's see how they relate
figure(2), clf, hold on
scatter(dPrimes,Fscores,20,specificity,'filled')
plot(get(gca,'xlim'),[.5 .5],'k--')
plot([0 0],get(gca,'ylim'),'k--')
xlabel('d-prime'), ylabel('F-score')
title([ 'Correlation = ' num2str(corr(Fscores,dPrimes)) ])

%% done.
