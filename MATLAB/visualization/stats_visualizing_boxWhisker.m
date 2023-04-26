%%
%   COURSE: Master statistics and machine learning: intuition, math, code
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Visualizing data
%    VIDEO: Box-and-whisker plots
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear

%% create data for the plot

% data sizes
m = 30; % rows
n =  6; % columns

% generate data
data = bsxfun(@times,30*randn(m,n),linspace(-1,1,n).^2);
data = bsxfun(@plus,data,(1:n).^2);

%% show it!

figure(1), clf

boxplot(data)

boxplot(data,{'one';'two';'three';'four';'five';'six'})

%% alternative: data in a single column, grouped by a separate variable

dataVect = data(:);
dataGrouping = ceil(linspace(eps,n,m*n));

figure(2), clf
boxplot(dataVect,dataGrouping,'notch','on','labels',{'one';'two';'three';'four';'five';'six'})

% for horizontal orientation
%boxplot(dataVect,dataGrouping,'notch','on','labels',{'one';'two';'three';'four';'five';'six'},'orientation','horizontal')

%% done.
