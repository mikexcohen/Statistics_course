%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Regression
%    VIDEO: Simple regression
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear, clc
pkg load statistics % load Octave stats package


%% example: effects of sleep on food spending

data = [
    5	47
    5.5	53
    6	52
    6	44
    7	39
    7	49
    7.5	50
    8	38
    8.5	43
    9	40
];


% start by showing the data
figure(1), clf, hold on
plot(data(:,1),data(:,2),'ko','markerfacecolor','k','markersize',10)
xlabel('Hours of sleep'), ylabel('Fijian dollars')
set(gca,'xlim',[4 10],'ylim',[36 54])

%% "manual" regression via least-squares fitting

% create the design matrix
desmat = cat(2,ones(10,1),data(:,1));

% compute the beta parameters (regression coefficients)
beta = desmat\data(:,2);

% predicted data values
yHat = desmat*beta;

%% show the predicted results on top of the "real" data

% predicted results
plot(data(:,1),yHat,'s-','color','b','markersize',10,'markerfacecolor','b')

% show the residuals
for i=1:10
    plot([1 1]*data(i,1),[data(i,2) yHat(i)],'m--')
end

h = legend({'Data (y)';'Model (\^{y})';'Residuals'},'Interpreter','latex');
set(h,'box','off')

%% now with the stats toolbox

[beta2,b_CI,resids,rint,stats] = regress(data(:,2),desmat);

% stats vector is R2, F, p-val, error variance
stats

% compare the betas
[ beta beta2 ]

%% done.
