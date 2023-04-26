%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Data normalizations and outliers
%    VIDEO: Z-score
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear
pkg load statistics % load Octave stats package

%% create data

data = poissrnd(3,1000,1).^2;

% compute the mean and std
datamean = mean(data);
datastd  = std(data);

figure(1), clf
subplot(211)
plot(data,'s','markersize',8,'markerfacecolor','r')
xlabel('Data index'), ylabel('Data value')
title([ 'Mean = ' num2str(round(datamean*100)/100) '; std = ' num2str(round(datastd*100)/100) ])

%% now for z-scoring

% z-score is data minus mean divided by stdev
dataz = (data-datamean) / datastd;

% can also use MATLAB function
% dataz = zscore(data);

% compute the mean and std
dataZmean = mean(dataz);
dataZstd  = std(dataz);

subplot(212)
plot(dataz,'s','markersize',8,'markerfacecolor','r')
xlabel('Data index'), ylabel('Data value')
title([ 'Mean = ' num2str(round(dataZmean*100)/100) '; std = ' num2str(round(dataZstd*100)/100) ])

%% show that the relative values are preserved

figure(2), clf
plot(data,dataz,'s','markersize',10,'markerfacecolor','r')
xlabel('Original'), ylabel('Z-transformed')
title([ 'Correlation r = ' num2str(corr(data,dataz)) ])

%% done.
