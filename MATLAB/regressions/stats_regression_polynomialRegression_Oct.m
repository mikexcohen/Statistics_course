%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Regression
%    VIDEO: Polynomial regression
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc
pkg load statistics % load Octave stats package

%% generate the data

n  = 30;
x  = linspace(-2,4,n);
y1 = x.^2 + randn(1,n);
y2 = x.^3 + randn(1,n);

%%% plot the data
figure(1), clf, hold on
plot(x,y1,'ko','markersize',10,'markerfacecolor','r','linewidth',2)
plot(x,y2,'ko','markersize',10,'markerfacecolor','g','linewidth',2)
legend({'Quadratic','Cubic'})

%% now for a polynomial fit

% for y1
pterms = polyfit(x,y1,2);
yHat1 = polyval(pterms,x);
plot(x,yHat1,'r','linewidth',2)

% for y2
pterms = polyfit(x,y2,3);
yHat2 = polyval(pterms,x);
plot(x,yHat2,'g','linewidth',2)

%% compute R2

% compute R2 for several polynomial orders
orders = 1:5;

% output matrices
r2 = zeros(2,length(orders));
sse = zeros(2,length(orders));

% the loop!
for oi=1:length(orders)
    
    % fit the model with oi terms
    pterms = polyfit(x,y1,orders(oi));
    yHat = polyval(pterms,x);
    
    % compute R2
    ss_eta = sum((y1-yHat).^2); % numerator
    ss_tot = sum((y1-mean(y1)).^2); % denominator
    r2(1,oi) = 1 - ss_eta/ss_tot; % R^2
    sse(1,oi) = ss_eta; % store just the SSe for model comparison later
    
    
    %%% repeat for y2
    pterms = polyfit(x,y2,orders(oi));
    yHat = polyval(pterms,x);
    ss_eta = sum((y2-yHat).^2);
    ss_tot = var(y2)*(n-1);
    r2(2,oi) = 1 - ss_eta/ss_tot;
    sse(2,oi) = ss_eta; % store just the SSe for model comparison later
end

% plot the results
figure(2), clf
subplot(211)
plot(orders,r2,'s-','linewidth',2,'markerfacecolor','w','markersize',12)
set(gca,'xlim',[orders(1)-.5 orders(end)+.5],'xtick',orders)
xlabel('Polynomial model order')
ylabel('Model R^2')
legend({'y_1 = x^2';'y_2 = x^3'})


% compute the Bayes Information Criterion
bic = n*log(sse) + orders*log(n);
subplot(212)
plot(orders,bic,'s-','linewidth',2,'markerfacecolor','w','markersize',12)
set(gca,'xlim',[orders(1)-.5 orders(end)+.5],'xtick',orders)
xlabel('Polynomial model order')
ylabel('BIC')
zoom on

%% done.
