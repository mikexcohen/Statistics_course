%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Analysis of Variance (ANOVA)
%    VIDEO: One-way ANOVA (independent samples)
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc

%% data parameters

% group means
mean1 = 4;
mean2 = 3.8;
mean3 = 7;

% samples per group
N1 = 30;
N2 = 35;
N3 = 29;

% standard deviation (assume common across groups)
stdev = 2;

%% now to simulate the data
rng(4)
data1 = mean1 + randn(N1,1)*stdev;
data2 = mean2 + randn(N2,1)*stdev;
data3 = mean3 + randn(N3,1)*stdev;

%% organize the data, method 1

% data in a vector with a group labels
alldata = [ data1; data2; data3 ];

grouplabels = [ ones(N1,1); 2*ones(N2,1); 3*ones(N3,1) ];
% or with text labels
% grouplabels = [ repmat("qwerty",N1,1); repmat("DrX",N2,1); repmat("purple",N3,1) ];
% note: Group assignment in anova1 can be numeric or string. This may cause
% problems with fitrm.

% now run the anova
[pval,anovatable,stats] = anova1(alldata,grouplabels,'on');

% multiple comparisons across the groups
multcompare(stats)


%% organize the data, method 2

% data in a matrix with NaNs for non-existing values
alldata = nan(max([N1 N2 N3]),3);

alldata(1:N1,1) = data1;
alldata(1:N2,2) = data2;
alldata(1:N3,3) = data3;

% group labels
grouplabels = {'qwerty';'DrX';'purple'};


% now run the anova
[pval2,anovatable2,stats2] = anova1(alldata,grouplabels,'off');

% multiple comparisons across the groups
multcompare(stats2)

%% done.
