%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Clustering and dimension-reduction
%    VIDEO: PCA
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc

%% create data

N = 1000;

% data
x = [ 1*randn(N,1) .4*randn(N,1) ];

% rotation matrix
th = pi/4;
R1 = [ cos(th) -sin(th); sin(th) cos(th) ];

% rotate data
y = x*R1;


% and plot
figure(1), clf
subplot(121)
axlim = [-1.1 1.1]*max(abs(y(:))); % axis limits
plot(y(:,1),y(:,2),'k.','markersize',10)
set(gca,'xlim',axlim,'ylim',axlim,'xtick',[],'ytick',[])
xlabel('X_1'), ylabel('X_2')
axis square
title('Data space')

%% now for PCA

% PCA using MATLAB's function
[coeffs,pcscores] = pca(y);

% plot
subplot(122)
plot(pcscores(:,1),pcscores(:,2),'k.','markersize',10)
set(gca,'xlim',axlim,'ylim',axlim,'xtick',[],'ytick',[])
xlabel('PC_1'), ylabel('PC_2')
axis square
title('PC space')

%% for dimension reduction

spikes = csvread('spikes.csv');

figure(2), clf
subplot(511)
plot(mean(spikes,1))

subplot(5,1,2:5)
imagesc(spikes)
xlabel('Time points')

%% pca

[coeffs,pcscores,~,~,explVar] = pca(spikes);


% show the scree plot (a.k.a. eigenspectrum)
figure(3), clf
subplot(221)
plot(explVar,'kp-','markerfacecolor','k','markersize',15)
xlabel('Component number')
ylabel('Percent variance explained')

subplot(222)
plot(cumsum(explVar),'kp-','markerfacecolor','k','markersize',15)
xlabel('Component number')
ylabel('Cumulative percent variance explained')


% now show the PC weights for the top two components
subplot(212)
plot(coeffs(:,1:2),'linew',3)
xlabel('Time')
legend({'Comp 1';'Comp 2'})
title('PC weights (coefficients)')


% finally, show the PC scores
figure(4), clf
plot(pcscores(:,1),pcscores(:,2),'k.','markersize',2)
xlabel('PC_1'), ylabel('PC_2')
axis square
title('PC space')

%% done.
