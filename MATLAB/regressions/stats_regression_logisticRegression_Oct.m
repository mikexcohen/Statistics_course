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
pkg load statistics % load Octave stats package

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

[intercept,betas,~,~,~,predvals] = logistic_regression(data(:,1),data(:,2:3),1);

%% compute the model prediction accuracy
%%% IMPORTANT NOTE: Octave outputs the predicted *accuracy for each label*, not the prediction for label=1

% convert to accuracy
aveacc = mean(predvals>.5);


%% plotting

figure(2), clf, hold on

plot(1:10,1-predvals(1:10),'ks','markerfacecolor','b','markersize',10)
plot(11:20,predvals(11:20),'ks','markerfacecolor','b','markersize',10,'HandleVisibility','off')
plot(get(gca,'xlim'),[1 1]*.5,'--','color','b','linewidth',2)
plot([1 1]*10.5,get(gca,'ylim'),'--','color','b','linewidth',2)

xlabel('Individual'), ylabel('p(pass)')
title([ 'Overall accuracy: ' num2str(aveacc) ])
legend({'Prediction';'Cut-off'})

%% done.
