%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Descriptive statistics
%    VIDEO: Data from different distributions
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear
pkg load statistics % load Octave stats package

%% Gaussian

% number of discretizations
N = 1001;

x = linspace(-4,4,N);
gausdist = normpdf(x);

figure(1), clf
subplot(211)
plot(x,gausdist,'linewidth',2)
title('Analytic Gaussian (normal) distribution')

% is this a probability distribution?
sum(gausdist)
% try scaling by dx...

%% Normally-distributed random numbers

% parameters
stretch = 1; % variance (square of standard deviation)
shift   = 5; % mean
n       = 1000;

% create data
data = stretch*randn(n,1) + shift;

% plot data
subplot(212)
hist(data,25)
title('Empirical normal distribution')

%% Uniformly-distributed numbers

% parameters
stretch = 2; % not the variance
shift   = .5;
n       = 10000;

% create data
data = stretch*rand(n,1) + shift-stretch/2;

% plot data
figure(2), clf
subplot(211)
plot(data,'.')
title('Uniform data values')

subplot(212)
hist(data,25)
title('Uniform data histogram')

%% log-normal distribution

N = 1001;
x = linspace(0,10,N);
lognormdist = lognpdf(x);

figure(3), clf
subplot(311)
plot(x,lognormdist,'linewidth',2)
title('Analytic log-normal distribution')

%% empirical log-normal distribution

shift   = 5;  % equal to the mean?
stretch = .5; % equal to standard deviation?
n = 2000;     % number of data points

% generate data
data = stretch*randn(n,1) + shift;
data = exp( data );

% plot data
subplot(312)
plot(data,'.')
title('Log-normal data values')

subplot(313)
hist(data,25)
title('Log-normal data histogram')

%% binomial

% a binomial distribution is the probability of K heads in N coin tosses,
% given a probability of p heads (e.g., .5 is a fair coin).

n = 10; % number on coin tosses
p = .5; % probability of heads

x = 0:n+2;
bindist = binopdf(x,n,p);

figure(4), clf
bar(x,bindist)
title([ 'Binomial distribution (n=' num2str(n) ', p=' num2str(p) ')' ])

%% t

x  = linspace(-4,4,1001);
df = 200;
t  = tpdf(x,df);

figure(5), clf
plot(x,t,'linewidth',3)
xlabel('t-value'),ylabel('P(t | H_0)')
set(gca,'fontsize',20,'ytick',0:.1:.4,'xlim',x([1 end]))
title([ 't(' num2str(df) ') distribution' ])
box off


%% F

% parameters
num_df = 5; % numerator degrees of freedom
den_df = 100; % denominator df

% values to evaluate 
x = linspace(0,10,10001);

% the distribution
fdist = fpdf(x,num_df,den_df);

figure(6), clf
plot(x,fdist,'linewidth',2)
title(sprintf('F(%g,%g) distribution' ,num_df,den_df))
xlabel('F value')

%% done.
