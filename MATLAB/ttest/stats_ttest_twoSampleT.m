%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: The t-test family
%    VIDEO: Two-sample t-test
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc

%% generate data

% parameters
n1 = 30;   % samples in dataset 1
n2 = 40;   % and 2
mu1 = 1;   % population mean in dataset 1
mu2 = 1.2; % population mean in dataset 2


% generate the data
data1 = mu1 + randn(n1,1);
data2 = mu2 + randn(n2,1);

% show their histograms
figure(1), clf, hold on
histogram(data1,'binmethod','fd')
histogram(data2,'binmethod','fd')
xlabel('Data value'), ylabel('Count')
legend({'Data 1';'Data 2'})

%% now for the t-test

[h,p,ci,stats] = ttest2(data1,data2,'tail','right','vartype','equa');

title([ 't(' num2str(stats.df) ') = ' num2str(stats.tstat) ', p=' num2str(p) ])

%% a 2D space of t values

% ranges for t-value parameters
meandiffs = linspace(-3,3,80);
pooledvar = linspace(.5,4,100);

% group sample size
n1 = 40;
n2 = 30;

% initialize output matrix
allTvals = zeros(length(meandiffs),length(pooledvar));

% loop over the parameters...
for meani=1:length(meandiffs)
    for vari=1:length(pooledvar)
        
        % t-value denominator
        df = n1 + n2 - 2;
        s  = sqrt(( (n1-1)*pooledvar(vari) + (n2-1)*pooledvar(vari)) / df);
        t_den = s * sqrt(1/n1 + 1/n2);
        
        % t-value in the matrix
        allTvals(meani,vari) = meandiffs(meani) / t_den;
    end
end

figure(2), clf
imagesc(pooledvar,meandiffs,allTvals)
xlabel('Variance'), ylabel('Mean differences')
set(gca,'clim',[-1 1]*4)
colorbar
title('t-values as a function of difference and variance')

%% done.
