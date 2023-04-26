%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Visualizing data
%    VIDEO: Line plots
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear
pkg load statistics % load Octave stats package

%% create data for the plot

% number of data points
n = 1000;

% generate log-normal distribution
data1 = exp( randn(n,1)/2 );
data2 = exp( randn(n,1)/10 );
data3 = exp( randn(n,1)/2 + 1 );

%% histograms on top of each other

% number of histogram bins
k = 20;

figure(1), clf, hold on
hist(data1,k)
hist(data2,k)
hist(data3,k)

%% plots of their histograms

% histogram discretization for the datasets
[y1,x1] = hist(data1,k);
y1 = y1 / sum(y1); % convert to probability

[y2,x2] = hist(data2,k);
y2 = y2 / sum(y2); % convert to probability

[y3,x3] = hist(data3,k);
y3 = y3 / sum(y3); % convert to probability


figure(2), clf, hold on
plot(x1,y1,'s-','linewidth',1,'markersize',8,'markerfacecolor','k')
plot(x2,y2,'o-','linewidth',1,'markersize',8,'markerfacecolor','k')
plot(x3,y3,'^-','linewidth',1,'markersize',8,'markerfacecolor','k')
xlabel('Value')
ylabel('Probability')
legend({'data1';'data2';'data3'})

%% done.
