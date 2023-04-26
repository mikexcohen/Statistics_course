%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Regression
%    VIDEO: Multiple regression
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear, clc
pkg load statistics % load Octave stats package

%% example: effects of sleep and study hours on exam scores
%%% create the data

exam_scores = [];
for ei=0:4
    exam_scores = [ exam_scores 60*ones(1,6)+linspace(-1,5,6)*ei ];
end

exam_scores = exam_scores'; % force column vector
hours_studied = repmat(linspace(2,8,6),1,5)';
ave_sleep_hrs = linspace(6,10,30)';

%% plot the data

% stratify by hours studied
figure(1), clf, hold on

% fewer than 4 hours studied
plotidx = hours_studied<4.1;
plot(ave_sleep_hrs(plotidx),exam_scores(plotidx),'ko','markerfacecolor','k','markersize',10)

% 5-6 hours studied
plotidx = hours_studied>4.9 & hours_studied<6.1;
plot(ave_sleep_hrs(plotidx),exam_scores(plotidx),'rs','markerfacecolor','r','markersize',10)

% more than 6 hours
plotidx = hours_studied>6;
plot(ave_sleep_hrs(plotidx),exam_scores(plotidx),'b^','markerfacecolor','b','markersize',10)

xlabel('Hours of sleep'), ylabel('Exam score')
legend({'<4 hours studied';'5-6 hours studied';'>7 hours studied'})

%% compute the multiple regression

% first create the design matrix
desmat = [ ones(30,1) ave_sleep_hrs hours_studied ave_sleep_hrs.*hours_studied ];

[beta,b_CI,resids,rint,stats] = regress(exam_scores,desmat);

% stats vector is R2, F, p-val, error variance
stats

%% inspect the residuals

figure(2), clf
plot(exam_scores,resids,'ks','markerfacecolor','k')
xlabel('Exam scores')
ylabel('Model residuals')

%% correlation of IVs

corr(desmat(:,2:end))

%% done.
