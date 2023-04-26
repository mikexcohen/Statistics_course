%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Correlation
%    VIDEO: Correlation coefficient
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc

%% simulate data

N = 66;

% generate correlated data
x = randn(N,1);
y = x + randn(N,1);

% plot the data
figure(1), clf
plot(x,y,'kp','markerfacecolor','b','markersize',12)
xlabel('Variable X'), ylabel('Variable Y')
set(gca,'xtick',[],'ytick',[])

%% compute covariance

% precompute the means
meanX = mean(x);
meanY = mean(y);

%%% the loop method
covar1 = 0;
for i=1:N
    covar1 = covar1 + (x(i)-meanX)*(y(i)-meanY);
end

% and now for the normalization
covar1 = covar1/(N-1);

%%% the linear algebra method
xCent = x-meanX;
yCent = y-meanY;
covar2 = xCent'*yCent / (N-1);


%%% the MATLAB method
covar3 = cov([x y]);

%% now for correlation

%%% the long method
corr_num = sum( (x-meanX) .* (y-meanY) );
corr_den = sum((x-meanX).^2) * sum((y-meanY).^2);
corr1 = corr_num/sqrt(corr_den);


%%% the MATLAB method
corr2 = corr([x y]);

%% correlation as normalized covariance

xn = zscore(x);
yn = zscore(y);

corr3 = xn'*yn / (N-1);

%% 2D t-value space based on r and n

% define parameters
r = linspace(-1,1,248);
n = round( linspace(5,200,73) );

% initialize t-value matrix
tmatrix = zeros(length(r),length(n));
pmatrix = zeros(length(r),length(n));

for ri=1:length(r)
    for ni=1:length(n)
        
        % the t-value, split into num/den
        num = r(ri)*sqrt(n(ni)-2);
        den = 1-r(ri)^2;
        
        tmatrix(ri,ni) = num/den;
        pmatrix(ri,ni) = 1-tcdf(abs(num/den),n(ni)-2);
    end
end

% Soooo curious to see it!
figure(2), clf, hold on
imagesc(n,r,tmatrix)
contour(n,r,pmatrix<.05,'k')
set(gca,'clim',[-1 1]*3)
xlabel('Sample size'), ylabel('Correlation coefficient')
title('T-values from different r-n combos')
colorbar

%% final note on statistical significance

[r,p] = corr(x,y)

%% done.
