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

%% using fitlm

% with explicit intercept
lm1 = fitlm(desmat,exam_scores,'VarNames',{'Intercept','Ave sleep','Study hours','Interaction','Exam scores'})

% without intercept
% lm2 = fitlm(desmat(:,2:end),exam_scores,'VarNames',{'Ave sleep','Studyhours','Interaction','Exam scores'});

% without interaction term
lm3 = fitlm(desmat(:,2:3),exam_scores,'VarNames',{'Ave sleep','Study hours','Exam scores'});

% specify the model
lm4 = fitlm(desmat(:,2:3),exam_scores,'exam ~ sleep*study',...
    'VarNames',{'sleep','study','exam'});

%% correlation of IVs

corr(desmat(:,2:end))

%% done.
