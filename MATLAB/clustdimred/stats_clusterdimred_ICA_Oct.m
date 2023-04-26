%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Clustering and dimension-reduction
%    VIDEO: ICA
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc
pkg load statistics % load Octave stats package

%% create data

% number of data points
N = 1000;

% a non-Gaussian distribution
dist1 = rand(N,1);

% another non-Gaussian distribution
dist2 = rand(N,1).^4;

% their separate and combined distributions
figure(1), clf
subplot(321)
hist(dist1,100)
title('Distribution 1')

subplot(322)
hist(dist2,100)
title('Distribution 2')

subplot(312)
hist(dist1+dist2,100)
title('Distribution 1+2')

%% ICA

% two non-Gaussian distributions
data = [ .4*dist1+.3*dist2 .8*dist1-.7*dist2 ]';

% ICA and scores
b = jader(data);
iscores = b*data;


% plot distributions

% IC 1
subplot(325), hist(iscores(1,:),100)
title('IC 1')

% IC 2
subplot(326), hist(iscores(2,:),100)
title('IC 2')

%% look at the data in data space and IC space

figure(2), clf
subplot(121)
plot(data(1,:),data(2,:),'o')
axis square
xlabel('Channel 1'), ylabel('Channel 2')

subplot(122)
plot(iscores(1,:),iscores(2,:),'o')
axis square
xlabel('IC 1'), ylabel('IC 2')

%% show that the original data match the ICs

% now plot data as a function of ICs
figure(3), clf
subplot(121)
plot(dist1,iscores(1,:),'o')
xlabel('Original signal'), ylabel('IC1 scores')
axis square

subplot(122)
plot(dist2,iscores(2,:),'o')
xlabel('Original signal'), ylabel('IC2 scores')
axis square

%% done.
