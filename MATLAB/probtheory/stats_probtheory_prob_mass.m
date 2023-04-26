%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Probability theory
%    VIDEO: Compute probability mass functions
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear

%% 

% re-run marble jar code from "compute probabilities"

%% compute empirical probability function

% continous signal (technically discrete!)
N = 10004;
datats1 = cumsum(sign(randn(N,1)));
datats2 = cumsum(sign(randn(N,1)));

% let's see what they look like
figure(2), clf
subplot(511)
plot(1:N,datats1, 1:N,datats2,'linew',2)
set(gca,'xlim',[1 N])



% discretize using histograms
nbins = 50;

[y,x] = histcounts(datats1,nbins);
x1 = (x(2:end)+x(1:end-1))/2;
y1 = y./sum(y);

[y,x] = histcounts(datats2,nbins);
x2 = (x(2:end)+x(1:end-1))/2;
y2 = y./sum(y);


% and draw
subplot(5,1,2:5)
plot(x1,y1, x2,y2,'linew',3)
legend({'ts1';'ts2'})
xlabel('Data value'), ylabel('Probability')

%% done.
