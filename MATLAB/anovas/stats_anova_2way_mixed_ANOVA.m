%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Analysis of Variance (ANOVA)
%    VIDEO: Two-way mixed-effects ANOVA
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear, clc

%% the data and group labels

data = csvread('TwoWayMixedANOVA_data.csv');

% correct way
group = [ repmat("Gr_A",15,1); repmat("Gr_B",15,1); repmat("Gr_C",15,1) ];


%%% note: the following is OK
%group = [ repmat('1',15,1); repmat('2',15,1); repmat('3',15,1) ];
% but the following is WRONG!!!!!
%group = [ repmat(1,15,1); repmat(2,15,1); repmat(3,15,1) ];


%% convert the data into a MATLAB table

tabl = table(group,data(:,1),data(:,2),data(:,3),'VariableNames',{'group';'t1';'t2';'t3'});

% correct way
repeatedFactor = table(["t1";"t2";"t3"],'VariableNames',{'TimePoints'});

% WRONG!!! (notice the numbers instead of char/string
% repeatedFactor = table((1:3)','VariableNames',{'TimePoints'});

%% run the ANOVA

% create the repeated-measures model
rm = fitrm(tabl,'t1-t3 ~ group','WithinDesign',repeatedFactor);

% ANOVA
ranova(rm,'WithinModel','TimePoints')

% multiple comparisons across groups
multcompare(rm,'TimePoints')

%% now to visualize the results

% hmmm...
plot(rm,'group','group')

% let's do this by organizing the data into a column with grouping variables
figure(2), clf
gr1 = repmat(1:3,size(data,1),1);
gr2 = [1*ones(15,1); 2*ones(15,1); 3*ones(15,1)];
gr2 = [gr2; gr2; gr2];

boxplot(data(:),[ gr1(:) gr2(:)],'colorgroup',gr1(:),'factorgap',[20 0])

%% done.
