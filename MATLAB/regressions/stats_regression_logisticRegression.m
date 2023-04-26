%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Regression
%    VIDEO: Logistic regression
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc

%% generate the data

% columns are: exam (pass/fail), study hours, sleep hours
data = [
    0	7.9	4.4
    0	7.9	5.2
    0	2.8	7.5
    0	5.4	4.6
    0	6.1	5.5
    0	4.5	6.1
    0	6.9	6.6
    0	2.3	3.1
    0	1.9	5.9
    0	1	3.2
    1	3.1	7.5
    1	5.7	7.8
    1	5.6	6.1
    1	4.7	5.4
    1	4.2	10.5
    1	2	8.2
    1	7.7	7.2
    1	6.5	7.2
    1	5.1	5.9
    1	3.7	7.9 ];

% show the data
figure(1), clf, hold on
plot([data(:,1)-.05 data(:,1)+.05]',data(:,2:3)','k','HandleVisibility','off')
plot(data(:,1)-.05,data(:,2),'ks','markerfacecolor',[255 204 255]/255,'markersize',15)
plot(data(:,1)+.05,data(:,3),'ks','markerfacecolor',[100 255 255]/255,'markersize',15)

set(gca,'xtick',[0 1],'xlim',[-.5 1.5],'ylim',[0 11],'xticklabel',{'Fail';'Pass'})
ylabel('Hours sleep or study')
legend({'Study';'Sleep'})

%% now run the logistic regression

% model specification
modelspec = 'exam ~ study*sleep - study:sleep';

% convert to a MATLAB table
D = array2table(data,'VariableNames',{'exam';'study';'sleep'});

% here's the fitting (binomial is for logistic regression)
mdl = fitglm(D,modelspec,'Distribution','binomial')

%% compute the model prediction accuracy

% predicted values (actually probabilities)
predvals = mdl.predict;

% convert to accuracy
aveacc = (mean(predvals(1:10)<.5) + mean(predvals(11:20)>.5))/2;


%% plotting

figure(2), clf, hold on

plot(predvals,'ks','markerfacecolor','b','markersize',10)
plot(get(gca,'xlim'),[1 1]*.5,'--','color','b','linewidth',2)
plot([1 1]*10.5,get(gca,'ylim'),'--','color','b','linewidth',2)

xlabel('Individual'), ylabel('p(pass)')
title([ 'Overall accuracy: ' num2str(aveacc) ])
legend({'Prediction';'Cut-off'})


%% FYI, a little more detail on how the predicted values are computed:

% get the coefficients
betas = table2array(mdl.Coefficients(:,1));

% design matrix
desmat = [ ones(size(data,1),1) data(:,2:3) ];

% the 'normal' predicted values are actually p/(1-p)
logp = desmat*betas;

% the predicted values are derived from the logistic
p = 1./(1+exp(logp));

% flip the probabilities b/c of how I coded the outcome
predvals2 = 1-p;

% compare
[predvals2 predvals]


%% done.
