%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Correlation
%    VIDEO: Correlation matrix
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc

%% simulate data

% simulation parameters
N = 1000;     % time points
M =   20;     % channels

% time vector (radian units)
t = linspace(0,6*pi,N);

% relationship across channels (imposing covariance)
chanrel = sin(linspace(0,2*pi,M))';

% create the data
data = bsxfun(@times,repmat( sin(t),M,1 ),chanrel);
data = data + randn(M,N);

% two ways of visualizing the multichannel data
figure(1), clf
plot(t,bsxfun(@plus,data,(1:M)'*4))
set(gca,'ytick',[],'xlim',t([1 end]))
xlabel('Time (a.u.)')
ylabel('Channel')

figure(2), clf
imagesc(t,[],data)
xlabel('Time (a.u.)')
ylabel('Channel')
set(gca,'clim',[-1 1]*2)

%% now compute the covariance matrix

% note the size of the output!
dataCovMat = cov(data');

figure(3), clf
imagesc(dataCovMat)
axis image
set(gca,'clim',[-1 1]*.5)
title('Data covariance matrix')
xlabel('??')
ylabel('??')

%% and now the correlation matrix

% note the size of the output!
dataCorrMat = corrcoef(data');

figure(4), clf
imagesc(dataCorrMat)
axis image
set(gca,'clim',[-1 1]*.5)
title('Data correlation matrix')
xlabel('??')
ylabel('??')

%% done.
