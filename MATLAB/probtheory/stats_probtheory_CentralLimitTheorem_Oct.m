%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Probability theory
%    VIDEO: Central limit theorem in action!
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc
pkg load statistics % load Octave stats package

%% create data from a power-law distribution

% data
N = 1000000;
data = randn(N,1).^2;
% alternative data
% data = sin(linspace(0,10*pi,N));

% show the distribution
figure(1), clf
subplot(211)
plot(data,'.')

subplot(212)
hist(data,40)

%% repeated samples of the mean

samplesize   = 30;
numberOfExps = 500;
samplemeans  = zeros(numberOfExps,1);

for expi=1:numberOfExps
    % get a sample and compute its mean
    sampleidx = randi(N,samplesize,1);
    samplemeans(expi) = mean(data( sampleidx ));
end

% and show its distribution
figure(2), clf
hist(samplemeans,30)
xlabel('Mean estimate'), ylabel('Count')

%%

%% linear mixtures

% create two datasets with non-Gaussian distributions
x = linspace(0,6*pi,10001);
s = sin(x);
u = 2*rand(size(x))-1;


figure(3), clf
subplot(231)
plot(x,s,'linewidth',3,'color','b')
title('Signal')

subplot(234)
[y,xx] = hist(s,200);
plot(xx,y,'linewidth',3,'color','b')
title('Distribution')

subplot(232)
plot(x,u,'linewidth',3,'color','m')
title('Signal')

subplot(235)
[y,xx] = hist(u,200);
plot(xx,y,'linewidth',3,'color','m')
title('Distribution')

subplot(233)
plot(x,s+u,'linewidth',3,'color','k')
title('Combined signal')

subplot(236)
[y,xx] = hist(s+u,200);
plot(xx,y,'linewidth',3,'color','k')
title('Combined distribution')

%% done.
