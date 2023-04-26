%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: The t-test family
%    VIDEO: One-sample t-test
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc
pkg load statistics % load Octave stats package

%% generate the data

% parameters
N = 20; % sample size
popMu = .5; % true population mean
data = randn(N,1) + popMu;

% let's see what the data look(s) like
figure(1), clf
plot(data,'ko-','markerfacecolor','w','linewidth',2,'markersize',10)
xlabel('Data index'), ylabel('Data value')

%%% question: Should there be lines in this plot?

%% "manual" t-test

% the null-hypothesis value
H0val = 0;

% compute the t-value
t_num = mean(data) - H0val;
t_den = std(data) / sqrt(N);
tval = t_num / t_den;

% degrees of freedom
df = N-1;

% p-value
pval = 1-tcdf(abs(tval),df);

% show the H0 parameter distribution and observed t-value
figure(2), clf, hold on
x = linspace(-4,4,1001);
tdist = tpdf(x,df) * mean(diff(x));

plot(x,tdist,'linewidth',2)
plot([1 1]*tval,[0 max(tdist)],'r--')
legend({'H_0 distribution';'Observed t-value'})
xlabel('t-value'), ylabel('pdf(t)')
title([ 't(' num2str(df) ') = ' num2str(tval) ', p=' num2str(pval) ])

%% now with MATLAB function

[h,p,c,stats] = ttest(data)

% do these values match our manually computed values?

%% done.
