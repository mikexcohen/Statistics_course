%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Descriptive statistics
%    VIDEO: QQ plots
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear

%% generate data

n    = 1000;
data = randn(n,1);
% data = exp( randn(n,1)*.8 ); % log-norm distribution

% theoretical normal distribution given N
x = linspace(-4,4,10001);
theonorm = normpdf(x);
theonorm = theonorm/max(theonorm);

% plot histograms on top of each other
[yy,xx] = histcounts(data,40);
yy = yy./max(yy);
xx = (xx(1:end-1)+xx(2:end))/2;

figure(1), clf, hold on
plot(xx,yy,'linew',3)
plot(x,theonorm,'linew',3)
legend({'Empirical';'Theoretical'},'box','off')
axis off

%% create a QQ plot

zSortData  = sort(zscore(data));
sortNormal = norminv(linspace(0,1,n));

% QQ plot is theory vs reality
figure(2), clf
plot(sortNormal,zSortData,'o','linew',3)

% set axes to be equal
lims = unique([get(gca,'xlim') get(gca,'ylim')]);
lims = [min(lims) max(lims)];
axis([lims lims]);

% draw comparison line
hold on
plot(lims,lims)

axis square
xlabel('Theoretical normal')
ylabel('Observed data')
title('QQ plot')

%% MATLAB solution

figure(3), clf
qqplot(data)
axis square

%% done.
