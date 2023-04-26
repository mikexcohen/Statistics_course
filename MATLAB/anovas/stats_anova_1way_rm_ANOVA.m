%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Analysis of Variance (ANOVA)
%    VIDEO: One-way repeated-measures ANOVA
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc

%% data parameters

% treatment means
mean1 = 4;
mean2 = 3.8;
mean3 = 7;

% samples (note: same across treatments)
N = 30;

% standard deviation (assume common across groups)
stdev = 2;

%% now to simulate the data

data1 = mean1 + randn(N,1)*stdev;
data2 = mean2 + randn(N,1)*stdev;
data3 = mean3 + randn(N,1)*stdev;

%% run the repeated-measures ANOVA

% first create the data table
tabl = table(data1,data2,data3,'VariableNames',{'qwerty';'DrX';'purple'});

% specify that all variables are in the same group
repeatedFactor = table(["a";"b";"c"],'VariableNames',{'levels'});


% create a model to be fit
rm = fitrm(tabl,'qwerty-purple ~ 1','WithinDesign',repeatedFactor);

% now fit the model
ranova_table = ranova(rm,'WithinModel','levels')


%% example from SPSS website

% https://www.spss-tutorials.com/repeated-measures-anova/

data = [
    8	7	6	7
    5	8	5	6
    6	5	3	4
    6	6	7	3
    8	10	8	6
    6	5	6	3
    6	5	2	3
    9	9	9	6
    5	4	3	7
    7	6	6	5];

% first create the data table
tabl = table(data(:,1),data(:,2),data(:,3),data(:,4),'VariableNames',{'task1';'task2';'task3';'task4'});
% or like this:
tabl = array2table(data,'VariableNames',{'task1';'task2';'task3';'task4'});


% specify that all variables are in the same group
repeatedFactor = table(["1";"2";"3";"4"],'VariableNames',{'task'});


% create a model to be fit
rm = fitrm(tabl,'task1-task4 ~ 1','WithinDesign',repeatedFactor);

% now fit the model
ranova_table = ranova(rm,'WithinModel','task')

%% done.
