%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Descriptive statistics
%    VIDEO: Computing central tendency
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear

%% create some data distributions

% the distributions
N = 10001; % number of data points
nbins = 30; % number of histogram bins

d1 = randn(N,1) - 1;
d2 = 3*randn(N,1);
d3 = randn(N,1) + 1;

% need their histograms
[y1,x1] = histcounts(d1,nbins);
x1 = (x1(1:end-1)+x1(2:end))/2;

[y2,x2] = histcounts(d2,nbins);
x2 = (x2(1:end-1)+x2(2:end))/2;

[y3,x3] = histcounts(d3,nbins);
x3 = (x3(1:end-1)+x3(2:end))/2;


% plot them
figure(1), clf
subplot(5,1,2:4), hold on

plot(x1,y1,'b','linew',2)
plot(x2,y2,'r','linew',2)
plot(x3,y3,'k','linew',2)

xlabel('Data values')
ylabel('Data counts')

%% overlay the mean

% compute the means
mean_d1 = sum(d1) / length(d1);
mean_d2 = mean(d2);
mean_d3 = mean(d3);

% plot them
plot([1 1]*mean_d1,[0 max(y1)],'b--')
plot([1 1]*mean_d2,[0 max(y2)],'r--')
plot([1 1]*mean_d3,[0 max(y3)],'k--')


%% "failure" of the mean

% new dataset of distribution combinations
d4 = [ randn(N,1)-2; randn(N,1)+2 ];
% and its histogram
[y4,x4] = histcounts(d4,nbins);
x4 = (x4(1:end-1)+x4(2:end))/2;

% and its mean
mean_d4 = mean(d4);


figure(2), clf, hold on
plot(x4,y4,'b','linew',2)
plot([1 1]*mean_d4,[0 max(y4)],'b--')

xlabel('Data values')
ylabel('Data counts')

%% median

% create a log-normal distribution
shift   = 0;
stretch = .7;
n       = 2000;
nbins   = 50;

% generate data
data = stretch*randn(n,1) + shift;
data = exp( data );

% and its histogram
[y,x] = histcounts(data,nbins);
x = (x(1:end-1)+x(2:end))/2;

% compute mean and median
datamean = mean(data);
datamedian = median(data);


% plot data
figure(3), clf
subplot(211), hold on
plot(data,'.','color',[1 1 1]*.5)
plot([1 n],[1 1]*datamean,'r--','linew',2)
plot([1 n],[1 1]*datamedian,'b--','linew',2)
legend({'Data';'Mean';'Median'})
title('Log-normal data values')

subplot(212), hold on
plot(x,y,'linew',3)
plot([1 1]*datamean,[0 max(y)],'r--','linew',2)
plot([1 1]*datamedian,[0 max(y)],'b--','linew',2)
title('Log-normal data histogram')

%% mode

data = round(randn(1,10))

uniq_data = unique(data);
for i=1:length(uniq_data)
    disp([ num2str(uniq_data(i)) ' appears ' num2str(sum(data==uniq_data(i))) ' times.' ])
end

disp([ 'The modal value is ' num2str(mode(data)) ])

%% done.
