%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Correlation
%    VIDEO: Simulate data with specified correlation
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc

%% simulate data

% data simulation parameters
N = 100; % number of samples
r = .6;  % desired correlation coefficient

% start with random numbers
x = randn(1,N);
y = randn(1,N);

% impose the correlation on y
y = x*r + y*sqrt(1-r^2);

% plot the data
figure(1), clf
plot(x,y,'kp','markerfacecolor','b','markersize',12)
xlabel('Variable X'), ylabel('Variable Y')
set(gca,'xtick',[],'ytick',[])

%% compute the empirical correlation

empR = corr(x',y');

title([ 'Desired r=' num2str(r) ', empirical r=' num2str(empR) ])

%% Test the errors as a function of N

% range of sample sizes
Ns = round( linspace(5,400,123) );

% theoretical correlation coefficient (fixed)
r = .6;

% initialize
corrs = zeros(size(Ns));

% run the experiment!
for ni=1:length(Ns)
    x = randn(Ns(ni),1);
    y = x*r + randn(Ns(ni),1)*sqrt(1-r^2);
    corrs(ni) = (r-corr(x,y))^2;
end

figure(2), clf
stem(Ns,corrs,'ko-','markerfacecolor','w','markersize',10,'linew',2)
xlabel('Sample size')
ylabel('Squared divergence')

%% done.
