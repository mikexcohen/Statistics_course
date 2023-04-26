%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Data normalizations and outliers
%    VIDEO: Euclidean distance for outlier removal
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc
pkg load statistics % load Octave stats package

%% create some data

N = 40;

% two-dimensional data
d1 = exp(-abs(randn(1,N)*3));
d2 = exp(-abs(randn(1,N)*5));
datamean = [ mean(d1) mean(d2) ];


% plot the data
figure(1), clf
subplot(121), hold on
plot(d1,d2,'ko','markerfacecolor','k','markersize',8);
axis square
set(gca,'xtick',[],'ytick',[])
xlabel('Variable x'), ylabel('Variable y')

% plot the multivariate mean
plot(datamean(1),datamean(2),'kp','markerfacecolor','g','markersize',15);

%% compute distance of each point to the mean

% standard distance measure
ds = zeros(N,1);
for i=1:N
    ds(i) = sqrt( (d1(i)-datamean(1))^2 + (d2(i)-datamean(2))^2 );
end

% convert to z (don't need the original data)
ds = zscore(ds);

% and plot those distances
subplot(122), hold on
plot(ds,'ko','markerfacecolor',[.7 .5 .3],'markersize',12);
axis square
xlabel('Data index'), ylabel('Z distance')

%% now for the thresholding

% threshold in standard deviation units
distanceThresh = 2.5;

% find the offending points
oidx = find(ds>distanceThresh);

% and cross those out
subplot(122)
plot(oidx,ds(oidx),'x','color','r','markersize',20,'linewidth',5);

subplot(121)
plot(d1(oidx),d2(oidx),'x','color','r','markersize',20,'linewidth',5);

%% done.
