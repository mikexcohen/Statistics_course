%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Visualizing data
%    VIDEO: Pie charts
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc
pkg load statistics % load Octave stats package

%% create data for the plot

nbins = 5;
totalN = 100;

rawdata = ceil(logspace(log10(1/2),log10(nbins-.01),totalN));

% prepare data for pie chart
uniquenums = unique(rawdata);
data4pie = zeros(length(uniquenums),1);

for i=1:length(uniquenums)
    data4pie(i) = sum(rawdata==uniquenums(i));
end

%% show the pie chart

figure(1), clf

subplot(121)
pie(data4pie)

subplot(122)
pie(data4pie',[0 30 0 1 0],{'one','two','three','four','five'})

%% for continuous data

% generate log-normal distribution
data = exp( randn(1000,1)/10 );


figure(2), clf

% generate bins using histogram
histbins = hist(data,6);

% and show that as a pie chart
pie(histbins)

%% done.
